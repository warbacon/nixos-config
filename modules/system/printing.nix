{
  pkgs,
  lib,
  ...
}:
{
  services.printing = {
    enable = lib.mkDefault false;
    drivers = with pkgs; [ hplipWithPlugin ];
  };
}
