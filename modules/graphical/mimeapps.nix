{
  xdg = {
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "kitty.desktop"
          "ghostty.desktop"
          "footclient.desktop"
          "alacritty.desktop"
          "wezterm.desktop"
        ];
      };
    };
    mime.defaultApplications = {
      "application/pdf" = [ "zen.desktop" ];
      "text/html" = [ "zen.desktop" ];
      "x-scheme-handler/http" = [ "zen.desktop" ];
      "x-scheme-handler/https" = [ "zen.desktop" ];
      "x-scheme-handler/mailto" = [ "zen.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    };
  };
}
