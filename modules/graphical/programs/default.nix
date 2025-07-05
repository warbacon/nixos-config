{ pkgs, inputs, ... }:
{
  imports = [
    ./firefox.nix
    ./foot
  ];

  # Enable Wayland in Chromium/Electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Needed to open firewall ports
  programs.localsend.enable = true;

  # Packages
  environment.systemPackages = [
    inputs.zen-browser.packages."${pkgs.system}".default
    pkgs.chromium
    pkgs.discord
    pkgs.loupe
    pkgs.mpv
    pkgs.obs-studio
    pkgs.pulsemixer
    pkgs.wl-clipboard-rs
  ];
}
