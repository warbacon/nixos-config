{
  lib,
  config,
  hostname,
  ...
}:
{
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
      shellInit = (builtins.readFile ./init.fish);
    };
  };
}
