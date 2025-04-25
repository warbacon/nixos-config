{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  # LSPs and tools
  environment.systemPackages = with pkgs; [
    astro-language-server
    basedpyright
    bash-language-server
    clang-tools
    docker-compose-language-service
    dockerfile-language-server-nodejs
    emmet-language-server
    intelephense
    lua-language-server
    markdownlint-cli
    nixd
    nixfmt-rfc-style
    shellcheck-minimal
    stylua
    tailwindcss-language-server
    vscode-langservers-extracted
    vtsls
    yaml-language-server
  ];

}
