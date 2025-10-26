{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = {
    this.gaming = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };

      nativeOnly = lib.mkOption {
        type = lib.types.bool;
        default = true;
      };

      maincra = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  };

  config = lib.mkIf config.this.gaming.enable {
    hardware.graphics.enable32Bit = !config.this.gaming.nativeOnly;
  };
}
