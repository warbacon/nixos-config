{ osConfig, ... }:
{
  imports = [
    ./starship
    ./fish
    ./git.nix
  ];

  programs.foot = {
    enable = osConfig.desktop.enable;
    server.enable = true;
  };

  programs.vicinae = {
    enable = osConfig.desktop.enable;
    systemd.enable = true;
  };

  programs.waybar = {
    enable = osConfig.desktop.enable;
    pkgs.waybar = true;
  };

  home.stateVersion = "25.11";
}
