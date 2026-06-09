{ pkgs, lib, ... }:
{
  home-manager.users.warbacon = {
    home.packages = with pkgs; [
      starship
    ];

    xdg.configFile."starship.toml".text = # toml
      ''
        add_newline = false
        format = """
        $nix_shell\
        $shell\
        $username\
        $directory\
        $git_branch\
        $git_commit\
        $git_status\
        $cmd_duration\
        $character"""

        [nix_shell]
        format = '[$symbol]($style) '
        symbol = ''

        [shell]
        disabled = false
        fish_indicator = '󰈺 fish'
        bash_indicator = ' bash'
        zsh_indicator = ' zsh'
        style = 'white'

        [username]
        format = '[$user]($style) '

        [directory]
        format = '[$read_only]($read_only_style)[$path]($style) '
        read_only = '󰌾 '

        [git_branch]
        format = '[\($branch\)](bold purple) '

        [cmd_duration]
        format = '[$duration]($style) '
        min_time = 3_000
      '';

    programs.bash = {
      initExtra =
        lib.mkBefore # bash
          ''
            source <(starship init bash --print-full-init)
          '';
    };

    programs.fish = {
      interactiveShellInit =
        lib.mkBefore # fish
          ''
            starship init fish --print-full-init | source
          '';
    };
  };
}
