{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.this.desktop == "plasma") {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
      };
    };

    environment.plasma6.excludePackages = [
      pkgs.kdePackages.elisa
    ];
  };
}
