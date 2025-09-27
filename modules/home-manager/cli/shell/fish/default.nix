{
  lib,
  config,
  osConfig,
  ...
}:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = lib.concatStrings [
      "set -x LS_COLORS '${config.home.sessionVariables.LS_COLORS}'"
      (builtins.readFile ./config.fish)
    ];
    shellAbbrs = osConfig.environment.shellAliases;
    preferAbbrs = true;
    generateCompletions = false;
  };

  programs.man.generateCaches = false;

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
