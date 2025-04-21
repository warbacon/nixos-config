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
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        zenarch = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            hostname = "zenarch";
          };
          modules = [
            ./hosts/zenarch
            home-manager.nixosModules.home-manager
          ];
        };
        wsl = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/wsl.nix
            home-manager.nixosModules.home-manager
            nixos-wsl.nixosModules.default
          ];
        };
      };
    };
}
