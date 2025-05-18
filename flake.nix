{
  description = "My personal NixOS configuration.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }@inputs:
    let
      mkSystem =
        {
          hostname,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs hostname;
          };
          modules = [
            { networking.hostName = hostname; }
            ./hosts/${hostname}
            home-manager.nixosModules.home-manager
          ] ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        zenix = mkSystem {
          hostname = "zenix";
        };

        nixwsl = mkSystem {
          hostname = "nixwsl";
          extraModules = [
            nixos-wsl.nixosModules.default
          ];
        };
      };
    };
}
