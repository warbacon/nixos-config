{ osConfig, pkgs, ... }:
{
  imports = [ ./swww.nix ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  programs.bash.profileExtra = # bash
    ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
        exec niri-session -l
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
}
