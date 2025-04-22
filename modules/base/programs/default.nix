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

  # NH
  programs.nh = {
    enable = true;
    flake = "/home/warbacon/Git/nixos-config";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 3d";
      dates = "daily";
    };
  };
}
