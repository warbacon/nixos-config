{ config, lib, ... }:
let
  cfg = config.desktop;
in
{
  config = lib.mkIf (cfg.profile == "niri") {
    programs.niri.enable = true;
  };
}
