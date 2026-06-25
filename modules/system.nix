{
  pkgs,
  lib,
  config,
  ...
}:
{
  boot = {
    loader = {
      systemd-boot.enable = lib.mkDefault true;
      timeout = 0;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "ntsync" ];
  };

  networking.networkmanager.enable = true;
  users.users.warbacon.extraGroups = [ "networkmanager" ];

  zramSwap.enable = true;

  environment.systemPackages = lib.optionals config.hardware.bluetooth.enable [
    pkgs.bluetui
  ];
}
