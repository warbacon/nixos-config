{ pkgs, ... }:
{
  imports = [
    ./btop.nix
    ./docker.nix
    ./git.nix
    ./neovim.nix
    ./starship.nix
  ];

  environment.systemPackages = [
    (pkgs.writeShellScriptBin "7z" ''exec ${pkgs._7zz-rar}/bin/7zz "$@"'')
    pkgs.dust
    pkgs.eza
    pkgs.fastfetch
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgs.jq
    pkgs.killall
    pkgs.libqalculate
    pkgs.ripgrep
    pkgs.tlrc
    pkgs.trash-cli
    pkgs.unzip
    pkgs.wget
    pkgs.xdg-utils
    pkgs.xh
    pkgs.zip
    # Development
    pkgs.bun
    pkgs.gcc
    pkgs.nodejs
    pkgs.python3
  ];
}
