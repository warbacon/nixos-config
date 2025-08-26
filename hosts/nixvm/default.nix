{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/base
    ./../../modules/system.nix
    ./../../modules/desktop
  ];

  # Hardware acceleration goes brr
  virtualisation.vmware.guest.enable = true;

  # Bloat
  virtualisation.docker.enable = false;

  # Why would I need that
  programs.adb.enable = false;

  # VMs works bad in latest
  boot.kernelPackages = pkgs.linuxPackages;

  # Works the best
  this.desktop = "gnome";
}
