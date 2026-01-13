{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop
    ../../modules/gaming.nix
    ../../nixos/common
    ../../nixos/system.nix
  ];

  services.tlp.enable = true;

  hardware.bluetooth.enable = true;

  desktop.enable = true;
  gaming.enable = true;

  environment.systemPackages = [ pkgs.vscode-fhs ];
}
