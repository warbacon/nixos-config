{ pkgs, ... }:
{
  imports = [
    ./mako
    ./scripts
    ./waybar
    ./walker
  ];

  programs.bash.profileExtra = # bash
    ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';

  home.packages = [
    pkgs.app2unit
  ];

  xdg.configFile."uwsm/env".text = # bash
    ''
      export GDK_SCALE=2
    '';

  systemd.user.services.wl-clip-persist = {
    Unit = {
      Description = "wl-clip-persist";
      ConditionEnvironment = "WAYLAND_DISPLAY";
      After = [
        "graphical-session.target"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.config/background" ];
      wallpaper = [ ",~/.config/background" ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 60;
          on-timeout = "dim-screen";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 180;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 300;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  xdg.portal = {
    enable = true;
    config = {
      hyprland = {
        default = "hyprland;gnome";
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
