{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.gaming;
in
{
  options = {
    gaming = {
      enable = lib.mkEnableOption "Enable gaming module";
      wine.enable = lib.mkEnableOption "Enable faugus-launcher";
      steam.enable = lib.mkEnableOption "Enable Steam";
      minecraft.enable = lib.mkEnableOption "Enable Prism Launcher";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.gamescope
      pkgs.mangohud
      pkgs.steam-run
    ]
    ++ lib.optionals cfg.wine.enable [
      pkgs.faugus-launcher
    ]
    ++ lib.optionals cfg.minecraft.enable [
      (pkgs.prismlauncher.override { jdks = [ pkgs.jdk21 ]; })
    ];

    hardware.graphics.enable32Bit = cfg.wine.enable;

    programs.steam = {
      enable = cfg.steam.enable;
    };
  };
}
