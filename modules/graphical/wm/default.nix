{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mimeapps.nix
    ./rofi
    ./scripts
    ./theming
    ./waybar

    ./niri.nix
  ];

  # Packages
  environment.systemPackages = [
    pkgs.wl-clip-persist
  ];
}
