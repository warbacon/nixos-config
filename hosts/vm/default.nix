{ lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home.nix
    ../../modules/common.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    efiSupport = false;
    style.wallpapers = lib.mkForce [ ];
  };

  virtualisation.vmware.guest.enable = true;
}
