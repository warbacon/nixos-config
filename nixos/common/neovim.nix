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
      customRC = # vim
        ''
          	  set number
          	  set relativenumber

          	  set softtabstop=-1
          	  set shiftwidth=4
          	  set expandtab
                    set undofile
          	'';
    };
  };
}
