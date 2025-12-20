{ lib, ... }:
{
  networking.networkmanager.enable = true;
  console.keyMap = "es";
  zramSwap.enable = true;

  boot.loader = {
    timeout = 0;
    systemd-boot = {
      enable = lib.mkDefault true;
      configurationLimit = 20;
    };
    efi.canTouchEfiVariables = true;
  };
}
