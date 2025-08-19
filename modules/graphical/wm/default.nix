{ pkgs, ... }:
{
  imports = [
    ./mako
    ./hypridle.nix
    ./hyprlock.nix
    # ./hyprpaper.nix
    ./mimeapps.nix
    ./rofi
    ./scripts
    ./theming
    # ./waybar

    ./hyprland.nix
  ];

  # Packages
  environment.systemPackages = [
    pkgs.file-roller
    pkgs.nautilus
    pkgs.wl-clip-persist
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.gvfs.enable = true;
}
