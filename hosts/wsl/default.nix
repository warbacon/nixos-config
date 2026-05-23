{ inputs, ... }:
{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
    ../../modules/home.nix
    ../../modules/common.nix
    ../../modules/dev.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "warbacon";
  };
}
