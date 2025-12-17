{ inputs, system, ... }:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages."${system}".default;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
    runtime = {
      "ftplugin/nix.vim".text = "setlocal shiftwidth=2";
    };
    configure = {
      customLuaRC = # lua
        ''
          vim.o.number = true
          vim.o.relativenumber = true
          vim.o.softtabstop = -1
          vim.o.shiftwidth = 4
          vim.o.expandtab = true
          vim.o.undofile = true

          vim.g.mapleader = ' '
          vim.keymap.set("n", "<Leader>f", ":find **/", { noremap = true })

          vim.pack.add({
            { src = "https://github.com/rose-pine/neovim", name = "rose-pine" }
          })

          vim.cmd.colorscheme("rose-pine")
        '';
    };
  };
}
