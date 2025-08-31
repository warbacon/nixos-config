{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.this.desktop == "gnome") {
    services = {
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;

      gnome.core-apps.enable = false;

      dleyna.enable = lib.mkForce false;
      gnome.at-spi2-core.enable = lib.mkForce false;
      gnome.evolution-data-server.enable = lib.mkForce false;
      gnome.gnome-initial-setup.enable = lib.mkForce false;
      gnome.rygel.enable = lib.mkForce false;
      hardware.bolt.enable = lib.mkForce false;
    };

    environment = {
      systemPackages = [
        pkgs.gnomeExtensions.appindicator
        pkgs.gnomeExtensions.caffeine
        pkgs.gnomeExtensions.pano

        pkgs.file-roller
        pkgs.gnome-characters
        pkgs.gnome-font-viewer
        pkgs.loupe
        pkgs.nautilus
      ];

      gnome.excludePackages = [
        pkgs.gnome-tour
        pkgs.orca
      ];
    };

    xdg.mime = {
      enable = true;
      defaultApplications = {
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      };
    };

    programs = {
      dconf = {
        enable = true;
        profiles = {
          user.databases = [
            {
              settings = {
                "org/gnome/desktop/wm/preferences" = {
                  resize-with-right-button = true;
                };
              };
            }
          ];
        };
      };
    };
  };
}
