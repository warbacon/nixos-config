{
  pkgs,
  lib,
  osConfig,
  ...
}:
{
  home.packages = [
    pkgs.sunsetr
  ]
  ++ lib.optionals (osConfig.this.desktop == "hyprland") [
    pkgs.hyprsunset
  ];

  xdg.configFile."sunsetr/sunsetr.toml".source = ./sunsetr.toml;
}
