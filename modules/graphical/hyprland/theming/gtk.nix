{
  config,
  pkgs,
  ...
}:
{
  home-manager.users.warbacon = {
    gtk = {
      enable = true;
      font = {
        name = "Geist";
        size = 10;
      };
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk2.configLocation = "${config.home-manager.users.warbacon.xdg.configHome}/gtk-2.0/gtkrc";
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:none";
      };
    };
  };
}
