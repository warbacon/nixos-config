{
  home-manager.users.warbacon.xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [
        "org.pwmt.zathura.desktop"
        "firefox.desktop"
      ];
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "image/png" = [ "imv.desktop" ];
      "image/jpeg" = [ "imv.desktop" ];
      "image/gif" = [ "imv.desktop" ];
    };
  };
}
