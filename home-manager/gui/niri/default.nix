{ osConfig, pkgs, ... }:
{
  imports = [
    ./swww.nix
    ./sunsetr.nix
    ./mako
    ./waybar
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  programs.bash.profileExtra = # bash
    ''
      if uwsm check may-start; then
        exec uwsm start niri-uwsm.desktop
      fi
    '';

  home.pointerCursor = {
    enable = osConfig.desktop.enable;

    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";

    dotIcons.enable = false;
    gtk.enable = true;
  };

  home.packages = [
    pkgs.adwaita-icon-theme
  ];

  gtk = {
    enable = true;
    colorScheme = "dark";
    font = {
      name = "Adwaita Sans";
      size = 10;
    };
    gtk2.enable = false;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "teal";
      color-scheme = "prefer-dark";
    };
  };
}
