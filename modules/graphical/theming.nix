{ config, pkgs, ... }:
{
  home-manager.users.warbacon = {
    # Packages
    home.packages = with pkgs; [
      adwaita-fonts
      lilex
      nerd-fonts.symbols-only
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    ];

    # Theming
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    gtk = {
      enable = true;
      font = {
        name = "Adwaita Sans";
        size = 10;
      };
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
      gtk2.configLocation = "${config.home-manager.users.warbacon.xdg.configHome}/gtk-2.0/gtkrc";
    };

    fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Lilex"
          "Symbols Nerd Font"
        ];
        sansSerif = [ "Adwaita Sans" ];
        serif = [ "Noto Serif" ];
      };
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
