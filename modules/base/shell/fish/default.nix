{
  lib,
  config,
  hostName,
  ...
}:
{
  programs.fish = {
    enable = true;

    useBabelfish = true;
    vendor.config.enable = false;

    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;

    interactiveShellInit =
      lib.mkIf (hostName == "nixwsl") # fish
        ''
          function code
            set code (which code)
            $code $argv
          end
        '';
  };

  documentation.man.generateCaches = false;

  home-manager.users.warbacon = {
    xdg.configFile = {
      "fish/themes" = {
        source = ./themes;
        recursive = true;
      };
      "fish/completions" = {
        source = ./completions;
        recursive = true;
      };
      "fish/functions" = {
        source = ./functions;
        recursive = true;
      };
    };

    programs.fish = {
      enable = true;
      preferAbbrs = true;
      interactiveShellInit = (builtins.readFile ./config.fish);
    };

    xdg.desktopEntries.fish = {
      name = "fish";
      noDisplay = true;
    };
  };
}
