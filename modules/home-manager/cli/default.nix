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
    ./git.nix
    ./neovim.nix
  ];

  home.packages = [
    pkgs.btop-rocm
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
    pkgs.jdk21
    pkgs.nodejs
    pkgs.python3
  ]
  ++ lib.optionals osConfig.hardware.bluetooth.enable [
    pkgs.ear2ctl
  ];
}
