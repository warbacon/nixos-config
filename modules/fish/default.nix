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
      shellAliases = lib.mkForce { };
      shellAbbrs = config.environment.shellAliases;
      interactiveShellInit = # fish
        ''
          set fish_greeting
          set fish_color_param --reset
          set fish_color_command cyan
          set fish_pager_color_progress brblack --italic
          set fish_pager_color_selected_background -b "2b3b51"
          fzf --fish | source
        '';
    };
  };
}
