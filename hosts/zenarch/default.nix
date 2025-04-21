{
  imports = [
    ../../modules/base
    ../../modules/system
    ../../modules/graphical
    ./hardware-configuration.nix
  ];

  nixi.bluetooth.enable = true;
  services.printing.enable = true;

  services.power-profiles-daemon.enable = true;
}
