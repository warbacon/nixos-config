{ inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae.enable = true;
  xdg.configFile."vicinae/settings.json".source = ./settings.jsonc;
}
