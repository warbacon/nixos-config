{ osConfig, lib, ... }:
{
  imports = [
    ./starship
    ./fish
    ./bash
    ./git.nix
    ./neovim.nix
  ]
  ++ lib.optionals osConfig.desktop.enable [
    ./gui
  ];

  home.stateVersion = "25.11";
}
