{ pkgs, lib, ... }:
{
  boot = {
    # Linux kernel
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    # Bootloader
    loader = {
      timeout = 0;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  # Network
  services.resolved = {
    enable = true;
    dnsovertls = "true";
  };

  networking = {
    nameservers = [
      "193.110.81.0#dns0.eu"
      "185.253.5.0#dns0.eu"
    ];
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };

  # Swap on ram
  zramSwap.enable = true;

  # Android Debug Bridge
  programs.adb.enable = lib.mkDefault true;

  # Configure console keymap
  console.keyMap = "es";
}
