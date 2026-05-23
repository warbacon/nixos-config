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

  environment.systemPackages = with pkgs; [
    pkgs.android-tools
    (discord.override { withOpenASAR = true; })
  ];
}
