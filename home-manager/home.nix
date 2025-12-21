{ osConfig, lib, ... }:
{
  imports = [
    ./starship
    ./fish
    ./bash
    ./git
    ./neovim.nix
  ]
  ++ lib.optionals osConfig.desktop.enable [
    ./gui
  ];

  home.stateVersion = "25.11";
}
