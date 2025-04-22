{ config, lib, ... }:
{
  environment.shellAliases = lib.mkForce {
    nhs = "nh os switch -a";
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
  };

  programs.command-not-found.enable = false;
}
