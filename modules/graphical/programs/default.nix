{
  pkgs,
  system,
  inputs,
  ...
}:
{
  imports = [
    ./firefox.nix
    ./kitty
  ];

  # Enable Wayland in Chromium/Electron
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Needed to open firewall ports
  programs.localsend.enable = true;

  # Packages
  environment.systemPackages = [
    inputs.zen-browser.packages."${system}".default
    pkgs.chromium
    pkgs.discord
    pkgs.imv
    pkgs.inkscape
    pkgs.libreoffice-fresh
    pkgs.mpv
    pkgs.wl-clipboard
  ];
}
