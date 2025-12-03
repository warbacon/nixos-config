{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.alacritty
  ];

  xdg.configFile."alacritty/alacritty.toml".text = lib.concatStrings [
    (builtins.readFile ./alacritty.toml)
    (builtins.readFile ./themes/tokyonight_night.toml)
  ];
}
