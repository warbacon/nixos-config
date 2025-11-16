{ inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    settings = {
      font.family = "Monospace";
      theme.name = "tokyonight";
      window.opacity = 1;
    };
  };

  xdg.dataFile."vicinae/themes" = {
    source = ./themes;
    recursive = true;
  };
}
