{
  description = "My personal NixOS configuration";

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

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixos-wsl,
      ...
    }@inputs:
    let
      overlays = [ inputs.neovim-nightly-overlay.overlays.default ];

      mkSystem =
        {
          hostName,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs hostName;
          };
          modules = [
            {
              networking.hostName = hostName;
              nixpkgs.overlays = overlays;
            }
            ./hosts/${hostName}
            ./modules/home-manager
            home-manager.nixosModules.home-manager
          ]
          ++ extraModules;
        };

      systems = [
        { hostName = "zenix"; }
        {
          hostName = "nixwsl";
          extraModules = [
            nixos-wsl.nixosModules.default
          ];
        }
        { hostName = "nixvm"; }
      ];

      generateSystems =
        list:
        nixpkgs.lib.listToAttrs (
          builtins.map (systemArgs: {
            name = systemArgs.hostName;
            value = mkSystem systemArgs;
          }) list
        );
    in
    {
      nixosConfigurations = generateSystems systems;
    };
}
