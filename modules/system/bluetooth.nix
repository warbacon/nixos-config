{
  pkgs,
  lib,
  config,
  ...
}:
{
  options.nixi = {
    bluetooth.enable = lib.mkEnableOption {
      description = "Enable bluetooth support";
      default = false;
    };
  };

  config = lib.mkIf config.nixi.bluetooth.enable {
    environment.systemPackages = [ pkgs.bluetui ];

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
}
