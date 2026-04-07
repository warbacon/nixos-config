{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
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

  zramSwap.enable = true;
}
