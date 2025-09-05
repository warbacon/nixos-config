{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.this.desktop == "hyprland") {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    programs.bash.loginShellInit = # bash
      ''
        if uwsm check may-start; then
          exec uwsm start hyprland-uwsm.desktop
        fi
      '';

    services = {
      upower.enable = true;
      gvfs.enable = true;
    };

    environment.systemPackages = [
      (pkgs.writeScriptBin "app2unit"
        # sh
        ''
          #!${pkgs.dash}/bin/dash
          exec ${pkgs.app2unit}/bin/app2unit "$@"
        ''
      )
      pkgs.brightnessctl
      pkgs.kitty
      pkgs.mako
      pkgs.pulsemixer
      pkgs.quickshell
      pkgs.rofi-wayland
      pkgs.wl-clip-persist
      pkgs.grim
      pkgs.slurp

      pkgs.loupe
      pkgs.nautilus

      pkgs.ffmpegthumbnailer
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.bluetui
    ];

    programs.dconf = {
      enable = true;
      profiles.user.databases = [
        {
          settings = {
            "org/gnome/desktop/interface" = {
              accent-color = "teal";
            };
            "org/gnome/desktop/wm/preferences" = {
              button-layout = "appmenu:none";
            };

          };
        }
      ];
    };

    xdg = {
      portal = {
        config = {
          hyprland = {
            default = "hyprland;gnome";
          };
        };
        extraPortals = [
          pkgs.xdg-desktop-portal-gnome
        ];
      };
      mime = {
        enable = true;
        defaultApplications = {
          "image/png" = [ "org.gnome.Loupe.desktop" ];
          "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
          "image/gif" = [ "org.gnome.Loupe.desktop" ];
          "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
        };
      };
    };
  };
}
