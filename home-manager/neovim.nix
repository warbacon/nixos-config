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

      clang-tools
      lua-language-server
      nixd
      nixfmt
      ruff
      stylua
      svelte-language-server
      tailwindcss-language-server
      vtsls
    ];
  };

  programs.bash.sessionVariables = {
    MANPAGER = "nvim +Man!";
  };
}
