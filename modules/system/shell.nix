{ config, lib, ... }:
{
  environment.shellAliases = lib.mkForce {
    nrs = "sudo nixos-rebuild switch --flake /home/warbacon/Git/nixos-config/";
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
  };

  programs.command-not-found.enable = false;
}
