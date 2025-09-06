{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = lib.concatStrings [
      (builtins.readFile ./kitty.conf)
      "\n# COLORSCHEME\n"
      (builtins.readFile ./themes/tokyonight.conf)
    ];
  };
}
