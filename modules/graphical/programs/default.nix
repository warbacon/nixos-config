{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./kitty
  ];

  # Enable Wayland in Chromium/Electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Needed to open firewall ports
  programs.localsend.enable = true;

  # Packages
  environment.systemPackages = with pkgs; [
    chromium
    discord
    imv
    libreoffice-fresh
    mpv
    vscode-fhs
    wl-clipboard
  ];
}
