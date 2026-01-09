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
  config = lib.mkIf (cfg.profile == "niri") {
    programs.niri.enable = true;

    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/niri-session";
        };
      };
    };

    environment.systemPackages = [
      pkgs.xwayland-satellite
      pkgs.wl-mirror
    ];
  };
}
