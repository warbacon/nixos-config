{
  description = "My NixOS configuration :P";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      lib = nixpkgs.lib;

      mkHost =
        name:
        lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
            hostName = name;
          };
          modules = [
            ./hosts/${name}
            {
              networking.hostName = name;
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = mkHost "desktop";
        vm = mkHost "vm";
        wsl = mkHost "wsl";
        zenix = mkHost "zenix";
      };
    };
}
