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
  networking = {
    networkmanager = {
      enable = true;
    };
  };

  # Swap on ram
  zramSwap.enable = true;

  # Android Debug Bridge
  programs.adb.enable = lib.mkDefault true;

  # Configure console keymap
  console.keyMap = "es";
}
