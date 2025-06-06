{ lib, ... }:
{
  home-manager.users.warbacon.programs.starship = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$shell"
        "$username"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$python"
        "$nix_shell"
        "$cmd_duration"
        "$line_break"
        "$jobs"
        "$status"
        "$character"
      ];

      nix_shell = {
        format = "via [$symbol $name]($style) ";
        symbol = "󰜗";
        style = "bold cyan";
      };

      shell = {
        disabled = false;
        fish_indicator = "󰈺 fish";
        bash_indicator = " bash";
        zsh_indicator = "󰏰 zsh";
        powershell_indicator = "󰨊 pwsh";
        nu_indicator = "󰞷 nu";
      };

      directory = {
        format = "[ $path]($style)[$read_only]($read_only_style) ";
        read_only = " 󰌾";
        truncation_length = 0;
        style = "bold blue";
      };

      git_commit = {
        tag_disabled = false;
        tag_symbol = "  ";
      };

      python = {
        format = "[($virtualenv)]($style) ";
        style = "bold bright-green";
        detect_extensions = [ ];
        detect_files = [ ];
      };

      status = {
        disabled = false;
        format = "[$status]($style) ";
        style = "bold bright-red";
      };

      character = {
        success_symbol = "❯";
        error_symbol = "[❯](bright-red)";
        vimcmd_symbol = "❮";
      };
    };
  };
}
