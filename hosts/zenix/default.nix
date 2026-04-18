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

  nixpkgs.config.android_sdk.accept_license = true;
  environment.packages = with pkgs; [
    obs-studio
    faugus-launcher
    onlyoffice-desktopeditors

    android-studio
    postman
    unityhub
    dotnetCorePackages.sdk_10_0-bin
    mono
    vscode-fhs
  ];
}
