{ pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
    # ./vim.nix
    ./yazi
  ];

  environment.systemPackages = [
    pkgs._7zz-rar
    pkgs.dust
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.ffmpeg
    pkgs.fzf
    pkgs.clang
    pkgs.hyperfine
    pkgs.jq
    pkgs.killall
    pkgs.ripgrep
    pkgs.tlrc
    pkgs.trash-cli
    pkgs.unzip
    pkgs.wget
    pkgs.xdg-utils
    pkgs.xh
    pkgs.zip
    # NodeJS
    pkgs.bun
    pkgs.nodejs
    # Python
    pkgs.python3
  ];
}
