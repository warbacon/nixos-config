{ inputs, system, ... }:
{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages."${system}".default;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };
}
