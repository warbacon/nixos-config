{
  description = "My personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
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
