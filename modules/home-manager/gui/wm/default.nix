{ osConfig, pkgs, lib, ... }:
{
  imports = [
    ./mako
    ./scripts
    ./waybar
    ./walker
  ]
  ++ lib.optionals (osConfig.this.desktop == "hyprland") [
    ./hyprland
  ]
  ++ lib.optionals (osConfig.this.desktop == "niri") [
    ./niri
  ];

  home.packages = [
    pkgs.app2unit
  ];

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
          timeout = 300;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
