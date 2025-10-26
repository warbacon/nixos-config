{
  pkgs,
  osConfig,
  lib,
  ...
}:
{
  imports = [
    ./lazygit
    ./starship
    ./shell
    ./tmux

    ./bottom.nix
    ./git.nix
    ./neovim.nix
  ];

  home.packages = [
    pkgs.chafa
    pkgs.dust
    pkgs.eza
    pkgs.fastfetch
    pkgs.fzf
    pkgs.hyperfine
    pkgs.libqalculate
    pkgs.tlrc
    pkgs.trash-cli
    pkgs.xdg-utils
    # Development
    pkgs.bun
    pkgs.jdk
    pkgs.nodejs
    pkgs.python3
  ]
  ++ lib.optionals osConfig.hardware.bluetooth.enable [
    pkgs.ear2ctl
  ];
}
