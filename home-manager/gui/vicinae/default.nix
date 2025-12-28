{ inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."vicinae/settings.json".source = ./settings.jsonc;
}
