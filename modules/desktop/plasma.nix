{ config, lib, ... }:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf (cfg.profile == "plasma") {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    xdg.mime.defaultApplications = {
      "image/png" = [ "org.kde.gwenview.desktop" ];
      "image/jpeg" = [ "org.kde.gwenview.desktop" ];
      "image/gif" = [ "org.kde.gwenview.desktop" ];
      "inode/directory" = [ "org.kde.dolphin.desktop" ];
    };
  };
}
