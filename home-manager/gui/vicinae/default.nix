{ pkgs, inputs, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  home.packages = [
    pkgs.app2unit
  ];

  services.vicinae = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."vicinae/settings.json".source = ./settings.jsonc;
}
