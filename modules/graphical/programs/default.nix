{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./kitty
  ];

  # Enable Wayland in Chromium/Electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Needed to open firewall ports
  programs.localsend.enable = true;

  # Packages
  environment.systemPackages = [
    pkgs.chromium
    pkgs.discord
    pkgs.imv
    pkgs.libreoffice-fresh
    pkgs.mpv
    pkgs.vscode-fhs
    pkgs.wl-clipboard
  ];
}
