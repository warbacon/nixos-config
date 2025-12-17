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
    environment.systemPackages = [
      pkgs.fuzzel
      pkgs.foot
    ]
    ++ lib.optionals config.hardware.bluetooth.enable [
      pkgs.adw-bluetooth
    ];
  };
}
