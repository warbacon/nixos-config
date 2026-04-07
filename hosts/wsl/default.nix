{ ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/dev.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "warbacon";
  };

  networking.hostName = "wsl";
}
