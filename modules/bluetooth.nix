{ pkgs, lib, config, ... }:

with lib;

{
  options.bluetooth = {
    enable = mkEnableOption "Bluetooth support with bluetui";
    default = false;
  };

  config = mkIf config.bluetooth.enable {
    environment.systemPackages = with pkgs; [
      bluetui
    ];

    hardware.bluetooth.enable = true;
  };
}
