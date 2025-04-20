{ config, lib, ... }:
{
  config = lib.mkIf (!config.wsl.enable) {
    boot.loader.timeout = 0;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
