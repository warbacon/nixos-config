{ lib, config, ... }:
{
  config = lib.mkIf (config.this.desktop == "hyprland") {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };
  };
}
