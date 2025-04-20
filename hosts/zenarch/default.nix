{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core.nix
    ../../modules/system/audio.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/bootloader.nix
    ../../modules/system/desktop.nix
    ../../modules/system/networking.nix
    ../../modules/system/printing.nix
  ];

  # PPD
  services.power-profiles-daemon.enable = true;
}
