{ pkgs, ... }:
{
  imports = [
    ./mako
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mimeapps.nix
    ./rofi
    ./scripts
    ./theming
    ./waybar

    ./niri
  ];

  # Packages
  environment.systemPackages = [
    pkgs.file-roller
    pkgs.nautilus
    pkgs.wl-clip-persist
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "foot";
  };

  services.gvfs.enable = true;
}
