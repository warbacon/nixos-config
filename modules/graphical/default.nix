{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./audio.nix
    ./firefox.nix
    ./theming.nix
    ./mimeapps.nix
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    (zathura.override { useMupdf = true; })
    chromium
    ear2ctl
    kitty
    libreoffice-fresh
    localsend
    mpv
    wl-clipboard
  ];
}
