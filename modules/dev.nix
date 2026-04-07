{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash-language-server
    emmylua-ls
    nixd
    nixfmt
    prettierd
    shellcheck
    shfmt
    stylua
    taplo
    tree-sitter
    typescript-go
    vscode-langservers-extracted
    yaml-language-server

    bun
    nodejs
    dotnetCorePackages.sdk_10_0-bin
    mono
  ];
}
