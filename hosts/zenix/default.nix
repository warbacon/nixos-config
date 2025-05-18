{
  imports = [
    ../../modules/base
    ../../modules/system
    ../../modules/graphical
    ./hardware-configuration.nix
  ];

  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  services.power-profiles-daemon.enable = true;
}
