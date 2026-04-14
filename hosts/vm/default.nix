{ lib, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/dev.nix
    ../../modules/audio.nix
    ../../modules/gui.nix
    ../../modules/system.nix
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = false;
  boot.loader.limine = {
    enable = true;
    style.wallpapers = lib.mkForce [ ];
  };

  virtualisation.vmware.guest.enable = true;

  networking.hostName = "vm";
}
