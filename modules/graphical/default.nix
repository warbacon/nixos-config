{ pkgs, ... }:
{
  imports = [
    ./hyprland
    ./audio.nix
    ./theming.nix
    ./mimeapps.nix
    ./programs
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    chromium
    ear2ctl
    imv
    kitty
    libreoffice-fresh
    localsend
    mpv
    nvtopPackages.amd
    wl-clipboard
  ];
}
