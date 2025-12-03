{
  lib,
  config,
  pkgs,
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
    programs.steam.dedicatedServer.openFirewall = true;
    environment.systemPackages = [
      pkgs.gamescope
      pkgs.mangohud
      pkgs.steam-run-free
    ]
    ++ lib.optionals config.this.gaming.maincra [
      (pkgs.prismlauncher.override { jdks = [ pkgs.jdk21 ]; })
    ]
    ++ lib.optionals (!config.this.gaming.nativeOnly) [
      pkgs.faugus-launcher
    ];
  };
}
