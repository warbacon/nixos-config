{ pkgs, ... }:
{
  home.packages = [ pkgs.sunsetr ];

  xdg.configFile."sunsetr/sunsetr.toml".text = # toml
    ''
      transition_mode = "static"
      static_temp=3300
      static_gamma=100
    '';
}
