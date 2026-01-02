{
  inputs,
  system,
  pkgs,
  ...
}:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages."${system}".default;
    withPython3 = false;
    withRuby = false;

    extraPackages = with pkgs; [
      tree-sitter

      bash-language-server
      clang-tools
      emmet-language-server
      jdt-language-server
      lua-language-server
      nixd
      nixfmt
      oxlint
      shellcheck
      shfmt
      stylua
      svelte-language-server
      tailwindcss-language-server
      taplo
      typescript-go
      vscode-langservers-extracted
      yaml-language-server
    ];
  };

  programs.bash.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };
}
