{ lib, ... }:
{
  programs.fish = {
    enable = true;
    generateCompletions = false;
    preferAbbrs = true;
    interactiveShellInit = lib.readFile ./config.fish;
  };

  xdg.configFile = {
    "fish/functions" = {
      recursive = true;
      source = ./functions;
    };
    "fish/completions" = {
      recursive = true;
      source = ./completions;
    };
    "fish/themes" = {
      recursive = true;
      source = ./themes;
    };
    "fish/conf.d" = {
      recursive = true;
      source = ./conf.d;
    };
  };
}
