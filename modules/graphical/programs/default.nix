{ pkgs, ... }:
{
  imports = [
    ./firefox.nix
    ./zathura.nix
    ./kitty
  ];

  # Packages
  environment.systemPackages = with pkgs; [
    chromium
    imv
    libreoffice-fresh
    localsend
    mpv
    wl-clipboard
  ];
}
