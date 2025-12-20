{ pkgs, ... }:
{
  home.packages = [
    pkgs.starship
  ];

  xdg.configFile."starship.toml".source = ./starship.toml;

  programs.bash.initExtra = # bash
    ''
      _add_newline() {
          [[ -z "$_should_add_newline" ]] && _should_add_newline=true || echo
      }
      PROMPT_COMMAND="_add_newline; $PROMPT_COMMAND"

      [[ -d "$HOME/.cache/starship" ]] || mkdir -p "$HOME/.cache/starship"

      if [[ ! -f "$HOME/.cache/starship/init.sh" ]]; then
          starship init bash --print-full-init >"$HOME/.cache/starship/init.sh"
          starship completions bash >>"$HOME/.cache/starship/init.sh"
      fi

      source "$HOME/.cache/starship/init.sh"
    '';

  programs.fish.interactiveShellInit = # fish
    ''
      set -l starship_cache ~/.cache/starship/init.fish

      # Ensure cache directory exists
      mkdir -p (dirname $starship_cache)

      # Generate or update cached init file
      if not test -f $starship_cache
          starship init fish --print-full-init >$starship_cache
      end

      source $starship_cache

      function prompt_newline --on-event fish_prompt --description "Add newline between prompts"
          if set -q __prompt_add_newline
              printf "\n"
          else
              set -g __prompt_add_newline true
          end
      end
    '';
}
