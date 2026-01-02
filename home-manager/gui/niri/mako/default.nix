{ pkgs, ... }:
{
  home.packages = [
    pkgs.libnotify
  ];

  services.mako = {
    enable = true;
    extraConfig = (builtins.readFile ./config.ini);
  };
}
