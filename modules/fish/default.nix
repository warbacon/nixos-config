{ lib, config, ... }:
{
  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
  };

  home-manager.users.warbacon = {
    programs.fish = {
      enable = true;
      generateCompletions = false;
      shellAliases = lib.mkForce { };
      shellAbbrs = config.environment.shellAliases;
      interactiveShellInit = # fish
        ''
          fzf --fish | source
        '';
    };
  };
}
