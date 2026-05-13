{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree-sitter

    bash-language-server
    clang-tools
    emmet-language-server
    emmylua-ls
    nixd
    svelte-language-server
    tailwindcss-language-server
    typescript-go
    vscode-langservers-extracted
    yaml-language-server

    nixfmt
    prettierd
    shellcheck
    shfmt
    stylua
    taplo

    bun
    nodejs

    gh
    lazygit
    pi-coding-agent
    pnpm
    lmstudio
  ];
}
