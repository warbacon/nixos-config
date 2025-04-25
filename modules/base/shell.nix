{ config, lib, hostname, ... }:
{
  environment.shellAliases = lib.mkForce {
    nrs = "sudo nixos-rebuild switch --flake ~/Git/nixos-config#${hostname}";
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
    interactiveShellInit =
      lib.mkIf (hostname == "nixwsl") # fish
        ''
          function code
            set code (which code)
            $code $argv
          end
        '';
  };

  programs.command-not-found.enable = false;
}
