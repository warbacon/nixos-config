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

    environment.systemPackages = [
      pkgs.xwayland-satellite
    ];
  };
}
