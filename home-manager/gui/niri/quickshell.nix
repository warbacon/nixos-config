{ pkgs, ... }:
{
  home.packages = [
    pkgs.quickshell
  ];

  programs.neovim.extraPackages = [
    pkgs.kdePackages.qtdeclarative
  ];
}
