{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  desktop = "hyprland";

  bluetooth.enable = true;
  printing.enable = true;

  # PPD
  services.power-profiles-daemon.enable = true;
}
