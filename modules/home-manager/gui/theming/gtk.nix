{ config, pkgs, ... }:
let
  homeDir = config.home.homeDirectory;

in
{
  gtk = {
    enable = true;
    gtk3.theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
    gtk2.configLocation = "${homeDir}/gtk-2.0/gtkrc";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
