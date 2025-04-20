{ pkgs, lib, config, ... }:

with lib;

{
  options.printing = {
    enable = mkEnableOption "Printing support";
    default = false;
  };

  config = {
    services.printing = {
      enable = config.printing.enable;
      drivers = with pkgs; [ hplipWithPlugin ];
    };
  };
}
