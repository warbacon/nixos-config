{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/base
    ./../../modules/system.nix
    ./../../modules/desktop
  ];

  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  services.power-profiles-daemon.enable = true;

  this.desktop = "niri";
  this.gaming = {
    enable = true;
    nativeOnly = false;
  };
}
