{ pkgs, ... }:
{
  imports = [
    ./hyprland
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
    imv
    kitty
    libreoffice-fresh
    localsend
    mpv
    nvtopPackages.amd
    wl-clipboard
  ];
}
