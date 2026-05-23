{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/home.nix
    ../../modules/common.nix
    ../../modules/dev.nix
    ../../modules/gui.nix
  ];

  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    (discord.override { withOpenASAR = true; })
  ];
}
