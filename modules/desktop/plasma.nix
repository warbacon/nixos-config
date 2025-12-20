{ config, lib, ... }:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf (cfg.profile == "plasma") {
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;
  };
}
