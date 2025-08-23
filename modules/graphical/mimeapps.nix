{
  home-manager.users.warbacon.xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = [ "zen-beta.desktop" ];
        "text/html" = [ "zen-beta.desktop" ];
        "x-scheme-handler/http" = [ "zen-beta.desktop" ];
        "x-scheme-handler/https" = [ "zen-beta.desktop" ];
        "x-scheme-handler/mailto" = [ "zen-beta.desktop" ];
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
      };
    };
  };
}
