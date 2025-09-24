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

    services.gvfs.enable = true;

    environment.systemPackages = [
      pkgs.loupe

      pkgs.ffmpegthumbnailer
      pkgs.nautilus

      pkgs.brightnessctl
      pkgs.pulsemixer
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.bluetui
    ];

    programs.dconf = {
      enable = true;
      profiles.user.databases = [
        {
          settings = {
            "org/gnome/desktop/wm/preferences" = {
              button-layout = "appmenu:none";
            };

          };
        }
      ];
    };

    xdg = {
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
