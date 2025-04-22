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
    dust
    eza
    fastfetch
    fd
    fzf
    gcc
    killall
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
    (php.withExtensions ({ enabled, all }: enabled ++ [ all.pdo ]))
    phpPackages.composer
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
