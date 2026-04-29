{ pkgs, ... }:

{
  imports = [
    ../../modules/common.nix
    ../../modules/dev.nix
    ../../modules/audio.nix
    ../../modules/gui.nix
    ../../modules/system.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "zenix";
  services.power-profiles-daemon.enable = true;
  hardware.bluetooth.enable = true;
  # services.upower.enable = true;

  nixpkgs.config.android_sdk.accept_license = true;
  environment.systemPackages = with pkgs; [
    obs-studio
    onlyoffice-desktopeditors

    android-studio
    unityhub
    dotnetCorePackages.sdk_10_0-bin
    mono
    vscode-fhs

    # brightnessctl
  ];
}
