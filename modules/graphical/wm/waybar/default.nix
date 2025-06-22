{ lib, config, ... }:
let
  foregroundColor = "#c0caf5";
  terminal = "alacritty msg create-window";
in
{
  home-manager.users.warbacon.programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = lib.concatStrings [
      (builtins.readFile ./tokyonight.css)
      (builtins.readFile ./style.css)
    ];
    settings = {
      mainBar = {
        layer = "top";
        height = 38;
        spacing = 6;

        modules-left =
          [ ]
          ++ lib.optionals config.programs.hyprland.enable [
            "hyprland/workspaces"
            "hyprland/window"
          ]
          ++ lib.optionals config.programs.niri.enable [
            "niri/workspaces"
            "niri/window"
          ];

        modules-center =
          [ ]
          ++ lib.optionals config.programs.hyprland.enable [
            "hyprland/submap"
          ];

        modules-right = [
          "privacy"
          "tray"
          "pulseaudio"
          "backlight"
          "battery"
          "network"
          "clock"
          "power-profiles-daemon"
        ];

        "hyprland/window" = {
          separate-outputs = true;
          icon = true;
          icon-size = 16;
        };

        "niri/window" = {
          separate-outputs = true;
          icon = true;
          icon-size = 16;
        };

        privacy = {
          icon-size = 16;
          icon-spacing = 5;
        };

        tray = {
          icon-size = 16;
          spacing = 5;
        };

        pulseaudio = {
          on-click = "killall -s1 pulsemixer || ${terminal} --class=float.term -e pulsemixer";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          format = "{icon} <span color='${foregroundColor}'>{volume} %</span>";
          format-muted = "󰝟";
          format-icons = {
            default = [
              "󰖀"
              "󰕾"
            ];
            headphone = "󰋋";
            headset = "󰋎";
          };
        };

        backlight = {
          format = "{icon} <span color='${foregroundColor}'>{percent} %</span>";
          tooltip = false;
          format-icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };

        battery = {
          format = "{icon} <span color='${foregroundColor}'>{capacity} %</span>";
          tooltip-format = "Tiempo restante: {time}";
          states = {
            warning = 20;
            critical = 5;
          };
          format-icons = {
            charging = "󰂄";
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
        };

        network = {
          format = "{icon} <span color='${foregroundColor}'>{essid}</span>";
          on-click = "killall -s1 nmtui || ${terminal} --class=float.term -e nmtui";
          tooltip-format = "{ifname}: {ipaddr}";
          format-disconnected = "{icon} sin conexión";
          format-icons = {
            disconnected = "󰌙";
            wifi = [
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
          };
        };

        clock = {
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          format = " <span color='${foregroundColor}'>{:L%H:%M}</span>";
          format-alt = " <span color='${foregroundColor}'>{:L%a, %d %b}</span>";
          calendar = {
            mode-mon-col = 3;
            format = {
              months = "<span color='#e0af68'><b>{}</b></span>";
              days = "<span color='#a9b1d6'>{}</span>";
              weekdays = "<span color='#faba4a'><b>{}</b></span>";
              today = "<span color='#7dcfff'><b>{}</b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Perfil de energía: {profile}";
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
      };
    };
  };
}
