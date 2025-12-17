{ pkgs, ... }:
{
  home.packages = [
    pkgs.starship
  ];

  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.fish.interactiveShellInit = # fish
    ''
      starship init fish --print-full-init | source
    '';
}
