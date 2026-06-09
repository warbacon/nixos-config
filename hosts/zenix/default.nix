{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home.nix
    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/dev.nix
    ../../modules/gui
  ];

  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    android-tools
    distrobox
  ];
}
