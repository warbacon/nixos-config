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

    extraPackages = [
      pkgs.tree-sitter

      pkgs.lua-language-server
      pkgs.nixd
      pkgs.nixfmt
      pkgs.stylua
    ];
  };
}
