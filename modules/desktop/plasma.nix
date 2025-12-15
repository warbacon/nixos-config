{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf (cfg.profile == "plasma") {
    services.displayManager.sddm.enable = lib.mkIf (cfg.profile == "plasma") true;
    services.desktopManager.plasma6.enable = lib.mkIf (cfg.profile == "plasma") true;
  };
}
