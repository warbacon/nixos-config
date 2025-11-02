{
  description = "My personal NixOS configuration";

  nixConfig = {
    extra-substiturers = [
      "https://vicinae.cachix.org"
      "https://walker.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

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
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };
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
