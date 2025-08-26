{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/base
    ./../../modules/system.nix
  ];

  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  services.power-profiles-daemon.enable = true;

  this.desktop = "gnome";
}
