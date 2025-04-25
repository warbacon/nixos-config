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

  environment.systemPackages = lib.mkIf cfg.enable [ pkgs.bluetui ];
}
