{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.hardware.bluetooth;
in
{
  environment.systemPackages = lib.mkIf cfg.enable [
    pkgs.bluetui
    pkgs.ear2ctl
  ];
}
