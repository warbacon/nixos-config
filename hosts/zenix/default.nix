{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home.nix
    ../../modules/common.nix
    ../../modules/system.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
  ];

  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;

  virtualisation.podman.enable = true;

  environment.systemPackages = with pkgs; [
    pkgs.android-tools
    distrobox
    (discord.override { withOpenASAR = true; })
  ];
}
