{ pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./docker.nix
    ./git.nix
    ./starship.nix
    ./btop.nix
  ];

  environment.systemPackages = with pkgs; [
    bun
    dust
    eza
    fastfetch
    fd
    fzf
    gcc
    killall
    nodejs
    php
    phpPackages.composer
    python3
    ripgrep
    tlrc
    trash-cli
    unzip
    wget
    xh
    yazi
    zip
  ];
}
