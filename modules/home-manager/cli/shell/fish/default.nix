{ osConfig, config, ... }:
{
  programs.fish = {
    enable = true;
    shellInit = # fish
      ''
        set -x LS_COLORS '${config.home.sessionVariables.LS_COLORS}'
      '';
    shellInitLast = builtins.readFile ./config.fish;
    shellAbbrs = osConfig.environment.shellAliases;
  };

  xdg = {
    configFile = {
      "fish/completions" = {
        source = ./completions;
        recursive = true;
      };
      "fish/functions" = {
        source = ./functions;
        recursive = true;
      };
      "fish/themes" = {
        source = ./themes;
        recursive = true;
      };
    };
  };
}
