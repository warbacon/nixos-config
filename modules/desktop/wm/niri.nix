{
  lib,
  config,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.this.desktop == "niri") {
    programs.niri.enable = true;

    environment.systemPackages = [
      pkgs.xwayland-satellite
      pkgs.wl-mirror
    ];
  };
}
