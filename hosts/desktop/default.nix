{ ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/dev.nix
    ../../modules/audio.nix
    ../../modules/gui.nix
    ../../modules/system.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "desktop";
}
