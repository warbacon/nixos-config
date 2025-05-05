{ hostname, ... }:
{
  imports = [
    ../../modules/base
    ../../modules/system
    ../../modules/graphical
    ./hardware-configuration.nix
  ];

  networking.hostName = hostname;

  virtualisation.vmware.guest.enable = true;
  boot.loader.systemd-boot.enable = false;
}
