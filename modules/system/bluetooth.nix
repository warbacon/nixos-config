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
  hardware.bluetooth = {
    powerOnBoot = false;
  };

  environment.systemPackages =
    with pkgs;
    lib.mkIf cfg.enable [
      bluetui
      ear2ctl
    ];
}
