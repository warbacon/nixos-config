{
  den.aspects.starship.homeManager =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.starship
      ];

      programs.bash.initExtra = # bash
        ''
          source <(starship init bash --print-full-init)
        '';

      xdg.configFile."starship.toml".text = # toml
        ''
          "$schema" = 'https://starship.rs/config-schema.json'
          add_newline = false
          format = "$shell$username$directory$git_branch$git_commit$git_status$cmd_duration$character"

          [shell]
          disabled = false
          fish_indicator = '󰈺 fish'
          bash_indicator = ' bash'
          style = 'white'

          [username]
          format = '[$user]($style) '

          [directory]
          format = '[$read_only]($read_only_style)[$path]($style) '
          read_only = '󰌾 '

          [git_branch]
          format = '[\($branch\)](bold purple) '

          [cmd_duration]
          min_time = 3_000
          format = '[$duration]($style) '
        '';
    };
}
