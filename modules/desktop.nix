{
  config,
  pkgs,
  lib,
  ...
}:
{
  options = {
    desktop = lib.mkOption {
      type = lib.types.str;
      default = "hyprland";
    };
  };

  config = lib.mkIf (!config.wsl.enable) {
    # Hyprland
    programs.hyprland = {
      enable = config.desktop == "hyprland";
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

    home-manager.users.warbacon.services.dunst = {
      enable = config.programs.hyprland.enable;
      settings = {
        global = {
          font = "monospace 11";
          frame_width = 1;
          gap_size = 6;
          height = "(0, 100)";
          max_icon_size = 64;
          offset = "20x20";
          width = "300";
          origin = "top-right";
          corner_radius = 8;
          icon_corner_radius = 6;
          progress_bar_corner_radius = 3;

          dmenu = "rofi -dmenu";

          mouse_left_click = "do_action, close_current";
          mouse_middle_click = "close_current";
          mouse_right_click = "context, close_current";

          background = "#16161e";
          foreground = "#c0caf5";
          frame_color = "#232533";
          highlight = "#ff9e64";
        };
        urgency_critical = {
          frame_color = "#f7768e";
        };
      };
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
  };
}
