{
  pkgs,
  lib,
  config,
  ...
}:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
    };
  };

  networking = {
    networkmanager = {
      enable = true;
      insertNameservers = [
        "193.110.81.0"
        "185.253.5.0"
      ];
    };
  };

  services.printing = {
    drivers = [ pkgs.hplipWithPlugin ];
  };

  zramSwap.enable = true;
  programs.adb.enable = true;

  environment.systemPackages = lib.mkIf config.hardware.bluetooth.enable [
    pkgs.bluetui
    pkgs.ear2ctl
  ];
}
