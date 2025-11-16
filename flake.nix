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
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    elephant.url = "github:abenz1267/elephant";

    walker = {
      url = "github:abenz1267/walker";
      inputs.elephant.follows = "elephant";
    };

    vicinae.url = "github:vicinaehq/vicinae";

    undux = {
      url = "github:warbacon/undux";
      inputs.nixpkgs.follows = "nixpkgs";
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
          system ? "x86_64-linux",
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          system = system;
          specialArgs = {
            inherit inputs hostName system;
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
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (args: {
          name = args.hostName;
          value = mkSystem args;
        }) systems
      );
    };
}
