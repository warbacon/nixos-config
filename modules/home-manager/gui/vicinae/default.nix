{ inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
  };

  xdg.dataFile."vicinae/themes" = {
    source = ./themes;
    recursive = true;
  };
}
