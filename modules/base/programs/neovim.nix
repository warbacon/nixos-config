{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  home-manager.users.warbacon = {
    programs.neovim = {
      enable = true;
      extraPackages = [
        pkgs.astro-language-server
        pkgs.basedpyright
        pkgs.bash-language-server
        pkgs.clang-tools
        pkgs.emmet-language-server
        pkgs.lua-language-server
        pkgs.nixd
        pkgs.nixfmt-rfc-style
        pkgs.shellcheck
        pkgs.shfmt
        pkgs.stylua
        pkgs.svelte-language-server
        pkgs.tailwindcss-language-server
        pkgs.vscode-langservers-extracted
        pkgs.vtsls
        pkgs.yaml-language-server
      ];
    };
    xdg.desktopEntries.nvim = {
      name = "nvim";
      noDisplay = true;
    };
  };
}
