{ lib, ... }:
{
  virtualisation = {
    docker = {
      enable = lib.mkDefault true;
      enableOnBoot = false;
    };
  };
}
