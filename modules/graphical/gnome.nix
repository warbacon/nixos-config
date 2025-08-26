{
  pkgs,
  lib,
  config,
  ...
}:
{
  services.displayManager.gdm.enable = true;

  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;

  services.gnome.evolution-data-server.enable = lib.mkForce false;
  services.dleyna.enable = lib.mkForce false;
  services.gnome.at-spi2-core.enable = lib.mkForce false;
  services.gnome.gnome-initial-setup.enable = lib.mkForce false;
  services.gnome.rygel.enable = lib.mkForce false;
  services.hardware.bolt.enable = lib.mkForce false;

  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.orca
  ];

  services.gnome.sushi.enable = true;

  home-manager.users.warbacon = {
    gtk = {
      enable = true;
      gtk3.theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk2.configLocation = "${config.home-manager.users.warbacon.xdg.configHome}/gtk-2.0/gtkrc";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  environment.systemPackages = [
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.pano

    pkgs.gnome-characters
    pkgs.nautilus
  ];
}
