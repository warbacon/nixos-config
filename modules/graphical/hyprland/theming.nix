{ config, pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    (ibm-plex.override { families = [ "mono" ]; })
    adwaita-fonts
    nerd-fonts.symbols-only
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  fonts.fontconfig = {
    enable = true;
    localConf = # xml
      ''
        <alias>
            <family>Consolas</family>
            <prefer>
              <family>monospace</family>
            </prefer>
        </alias>
      '';
    defaultFonts = {
      emoji = [ "Noto Color Emoji" ];
      monospace = [
        "IBM Plex Mono"
        "Symbols Nerd Font"
      ];
      sansSerif = [ "Adwaita Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

  home-manager.users.warbacon = {
    # Theming
    home.pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
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
