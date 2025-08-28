{ lib, ... }:
{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.mode = null;
    extraConfig = lib.concatStrings [
      (builtins.readFile ./kitty.conf)
      "\n# COLORSCHEME\n"
      (builtins.readFile ./themes/tokyonight.conf)
    ];
  };
}
