{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.foot
  ];

  programs.foot = {
    enable = true;
    server.enable = true;
  };

  xdg.configFile."foot/foot.ini" = {
    text = lib.concatStrings [
      (builtins.readFile ./foot.ini)
      (builtins.readFile ./themes/tokyonight_night.ini)
    ];
  };
}
