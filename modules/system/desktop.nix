{
  config,
  pkgs,
  lib,
  ...
}:
{
  # Hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Environment variables
  environment.variables = lib.mkIf config.programs.hyprland.enable {
    GDK_SCALE = 2;
  };

  # Autostart Hyprland
  programs.bash = lib.mkIf config.programs.hyprland.enable {
    loginShellInit = # bash
      ''
        if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
        fi
      '';
  };

  # Packages
  environment.systemPackages =
    with pkgs;
    [
      (zathura.override { useMupdf = true; })
      chromium
      ear2ctl
      kitty
      libreoffice-fresh
      localsend
      mpv
      wl-clipboard
    ]
    ++ lib.optionals config.programs.hyprland.enable [
      brightnessctl
      cliphist
      grim
      hyperfine
      hypridle
      hyprlock
      hyprpaper
      hyprsunset
      rofi-wayland
      rofimoji
      slurp
      waybar
      wl-clip-persist
    ];
}
