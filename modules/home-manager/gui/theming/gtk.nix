{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    font = {
      name = "Inter";
      size = 10;
    };
    gtk3.theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "teal";
      color-scheme = "prefer-dark";
    };
  };
}
