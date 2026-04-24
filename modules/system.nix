{ pkgs, lib, ... }:

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

  networking.networkmanager = {
    enable = true;
    wifi.backend = "iwd";
  };
  users.users.warbacon.extraGroups = [ "networkmanager" ];

  environment.systemPackages = [
    pkgs.android-tools
  ];

  zramSwap.enable = true;
}
