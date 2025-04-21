{ config, lib, hostname, ... }:
{
  environment.shellAliases = lib.mkForce {
    nrs = "sudo nixos-rebuild switch --flake /home/warbacon/Git/nixos-config/#${hostname}";
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
  };

  programs.command-not-found.enable = false;
}
