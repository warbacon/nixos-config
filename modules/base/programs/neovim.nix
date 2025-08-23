{ pkgs, inputs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
  };

  home-manager.users.warbacon = {
    programs.neovim = {
      enable = true;
      withRuby = false;
      withPython3 = false;
      package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
      extraPackages = [
        pkgs.astro-language-server
        pkgs.basedpyright
        pkgs.bash-language-server
        pkgs.clang-tools
        pkgs.emmet-language-server
        pkgs.jdt-language-server
        pkgs.kdePackages.qtdeclarative
        pkgs.lua-language-server
        pkgs.nixd
        pkgs.nixfmt-rfc-style
        pkgs.shellcheck
        pkgs.shfmt
        pkgs.stylua
        pkgs.svelte-language-server
        pkgs.tailwindcss-language-server
        pkgs.tree-sitter
        pkgs.vscode-langservers-extracted
        pkgs.vtsls
        pkgs.yaml-language-server
      ];
    };
    xdg.desktopEntries.nvim = {
      name = "Neovim";
      genericName = "Text Editor";
      comment = "Edit text files";
      settings = {
        "Comment[es]" = "Edita archivos de texto";
        Keywords = "Text;editor;";
        TryExec = "nvim";
      };
      exec = "nvim %F";
      icon = "nvim";
      terminal = true;
      type = "Application";
      categories = [
        "Utility"
        "TextEditor"
      ];
      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
      ];
      startupNotify = false;
    };

  };
}
