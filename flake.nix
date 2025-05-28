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
      system = "x86_64-linux";
      mkSystem =
        {
          hostname,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs hostname system;
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
