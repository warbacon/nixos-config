{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/core/audio.nix
    ../../modules/core/bootloader.nix
  ];

  desktop = "hyprland";

  bluetooth.enable = true;
  printing.enable = true;

  # PPD
  services.power-profiles-daemon.enable = true;
}
