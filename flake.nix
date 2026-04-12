{
  description = "My NixOS configuration :P";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    helium = {
      url = "github:schembriaiden/helium-browser-nix-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-index-database,
      nixos-wsl,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      mkHost =
        modules:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs system;
          };
          modules = modules ++ [ nix-index-database.nixosModules.default ];
        };
    in
    {
      nixosConfigurations = {
        zenix = mkHost [ ./hosts/zenix/default.nix ];
        desktop = mkHost [ ./hosts/desktop/default.nix ];
        vm = mkHost [ ./hosts/vm/default.nix ];
        wsl = mkHost [
          nixos-wsl.nixosModules.default
          ./hosts/wsl/default.nix
        ];
      };
    };
}
