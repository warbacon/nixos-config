{
  config,
  pkgs,
  lib,
  ...
}:
let
  cfg = config.desktop;
in
{
  imports = [
    ./niri.nix
  ];

  config = lib.mkIf (cfg.profile == "niri" || cfg.profile == "hyprland") {
    services.gvfs.enable = true;

    environment.systemPackages = [
      pkgs.brightnessctl
      pkgs.foot
      pkgs.fuzzel
      pkgs.nautilus
      pkgs.pulsemixer
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.adw-bluetooth
    ];
  };
}
