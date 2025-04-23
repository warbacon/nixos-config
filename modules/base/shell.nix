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
    interactiveShellInit =
      lib.mkIf (config.networking.hostName == "nixwsl") # fish
        ''
          function code
            set code (which code)
            $code $argv
          end
        '';
  };

  programs.command-not-found.enable = false;
}
