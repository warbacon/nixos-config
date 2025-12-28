{
  inputs,
  system,
  pkgs,
  ...
}:
{
  home.packages = [
    inputs.quickshell.packages."${system}".default
  ];

  programs.neovim.extraPackages = [
    pkgs.kdePackages.qtdeclarative
  ];
}
