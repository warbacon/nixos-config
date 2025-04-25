{ pkgs, ... }:
{
  imports = [
    ./bottom.nix
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
  ];

  environment.systemPackages = with pkgs; [
    _7zz-rar
    dust
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    jq
    killall
    poppler
    resvg
    ripgrep
    tlrc
    trash-cli
    unzip
    wget
    xh
    yazi
    zip
    # NodeJS
    bun
    nodejs
    # Python
    python3
    # Php
    php
    phpPackages.composer
  ];
}
