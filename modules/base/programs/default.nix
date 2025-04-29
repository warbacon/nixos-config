{ pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    ./yazi
  ];

  environment.systemPackages = with pkgs; [
    _7zz-rar
    dua
    eza
    fastfetch
    fd
    ffmpeg
    fzf
    gcc
    hyperfine
    jq
    killall
    ripgrep
    tlrc
    trash-cli
    unzip
    wget
    xdg-utils
    xh
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
