{ pkgs, ... }:
{
  imports = [
    ./hypridle.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./dunst.nix
    ./theming.nix
    ./mimeapps.nix
    ./rofi
    ./waybar
    ./scripts
  ];

  # Autostart Hyprland
  programs.fish = {
    loginShellInit = # fish
      ''
        if uwsm check may-start; and command -q Hyprland
          exec uwsm start hyprland-uwsm.desktop
        end
      '';
  };

  # Packages
  environment.systemPackages = with pkgs; [
    wl-clip-persist
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  home-manager.users.warbacon = {
    # Environment variables
    xdg.configFile."uwsm/env".text = # bash
      ''
        export GDK_SCALE=2
      '';

    xdg.desktopEntries.uuctl = {
      name = "uuctl";
      noDisplay = true;
    };
  };

  home-manager.users.warbacon.wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # MONITORS: https://wiki.hyprland.org/Configuring/Monitors ===============
      monitor = [
        "eDP-1, preferred, auto, 2"
        "desc:LG Electronics LG ULTRAGEAR 102NTZNG9205, preferred, auto-up, auto"
        ", preferred, auto, auto"
      ];

      # PROGRAMS ===============================================================
      "$terminal" = "kitty -1";
      "$fileManager" = "$terminal -e yazi";
      "$menu" = "rofi -show drun -show-icons";

      # AUTOSTART ==============================================================
      exec-once = [
        "wl-clip-persist --clipboard regular"
      ];

      # LOOK AND FEEL ==========================================================
      # wiki: https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 3;
        gaps_out = 6;

        border_size = 2;

        "col.active_border" = "rgb(ff9e64)";
        "col.inactive_border" = "rgb(27a1b9)";

        layout = "master";
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 0;
        # rounding_power = 4;

        # wiki: https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = false;
          passes = 3;
        };

        # https://wiki.hyprland.org/Configuring/Variables/#shadow
        shadow = {
          enabled = false;
        };
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = false;

        # wiki: https://wiki.hyprland.org/Configuring/Animations/
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 3, easeOutQuint, slidefade 20%"
        ];
      };

      # wiki: https://wiki.hyprland.org/Configuring/Master-Layout
      master = {
        new_on_top = true;
        new_status = "master";
        mfact = 0.5;
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        vrr = 1;
        disable_hyprland_logo = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        background_color = "rgb(000000)";
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#xwayland
      xwayland = {
        force_zero_scaling = true;
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#cursor
      cursor = {
        enable_hyprcursor = false;
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#ecosystem
      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      # INPUT ========================================================================
      # wiki: https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "es";

        repeat_rate = 31;

        accel_profile = "flat";

        touchpad = {
          natural_scroll = true;
          tap-to-click = false;
          middle_button_emulation = false;
          clickfinger_behavior = true;
        };
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.1;
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#per-device-input-config
      device = {
        name = "asue140d:00-04f3:31b9-touchpad";
        accel_profile = "adaptive";
      };

      # wiki: https://wiki.hyprland.org/Configuring/Variables/#binds
      binds = {
        allow_pin_fullscreen = true;
        scroll_event_delay = 100;
      };

      # KEYBINDINGS: https://wiki.hyprland.org/Configuring/Binds ===============
      bind = [
        # General
        "SUPER, Q, exec, $terminal"
        "SUPER, C, killactive,"
        "SUPER, E, exec, $fileManager"
        "SUPER, Space, togglefloating,"
        "SUPER, R, exec, $menu"
        "SUPER, F, fullscreen, 0"
        "SUPER, period, exec, rofimoji -r Emojis"
        "SUPER, V, exec, cliphist list | rofi -dmenu -d -p Portapapeles | cliphist decode | wl-copy"
        "SUPER, B, exec, killall -s1 bluetui || $terminal --class floatterm -e bluetui"
        "SUPER, P, exec, command_palette"
        ", Print, exec, screenshot fullscreen"
        "SHIFT, Print, exec, screenshot select"

        # Master-Layout
        "SUPER, j, layoutmsg, cyclenext"
        "SUPER, k, layoutmsg, cycleprev"
        "SUPER SHIFT, j, layoutmsg, swapnext"
        "SUPER SHIFT, k, layoutmsg, swapprev"

        # Audio
        ", XF86AudioMute, exec, change_volume muteaudio"
        ", XF86AudioMicMute, exec, change_volume mutemic"

        # Switch workspaces with mainMod + [0-9]
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        "SUPER, 7, workspace, 7"
        "SUPER, 8, workspace, 8"
        "SUPER, 9, workspace, 9"
        "SUPER, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
        "SUPER SHIFT, 7, movetoworkspace, 7"
        "SUPER SHIFT, 8, movetoworkspace, 8"
        "SUPER SHIFT, 9, movetoworkspace, 9"
        "SUPER SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "SUPER, mouse_down, workspace, e-1"
        "SUPER, mouse_up, workspace, e+1"
      ];

      binde = [
        # Master-Layout
        "SUPER, h, resizeactive, -50 0"
        "SUPER, l, resizeactive, 50 0"

        # Backlight
        ", XF86MonBrightnessUp, exec, change_brightness up"
        ", XF86MonBrightnessDown, exec, change_brightness down"

        # Audio
        ", XF86AudioRaiseVolume, exec, change_volume up"
        ", XF86AudioLowerVolume, exec, change_volume down"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      ### WINDOWS AND WORKSPACES ===============================================
      # wiki: https://wiki.hyprland.org/Configuring/Window-Rules
      # wiki: https://wiki.hyprland.org/Configuring/Workspace-Rules

      windowrule = [
        # Ignore maximize requests from apps.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        # Firefox Picture-in-Picture
        "float, initialTitle:Picture-in-Picture, initialClass:firefox"
        "pin, initialTitle:Picture-in-Picture, initialClass:firefox"
        "keepaspectratio, initialTitle:Picture-in-Picture, initialClass:firefox"
        "suppressevent activate, initialTitle:Picture-in-Picture, initialClass:firefox"
        "suppressevent fullscreen, initialTitle:Picture-in-Picture, initialClass:firefox"
        "size 512 288, initialTitle:Picture-in-Picture, initialClass:firefox"

        # Smart gaps
        "bordersize 0, floating:0, onworkspace:w[tv1]"
        "rounding 0, floating:0, onworkspace:w[tv1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"

        # Terminal floating window
        "float, class:(floatterm)"
        "size 1000 600, class:(floatterm)"
      ];
      workspace = [
        # Smart gaps
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
      layerrule = [
        # Rofi animation
        "animation popin 98%, rofi"
      ];
    };
    extraConfig = # hyprlang
      ''
        bind = SUPER, N, submap, notificaciones
        submap = notificaciones
        bind = , escape, submap, reset
        bind = , O, exec, dunstctl context && hyprctl dispatch submap reset
        bind = , C, exec, dunstctl close-all && hyprctl dispatch submap reset
        submap = reset
      '';
  };
}
