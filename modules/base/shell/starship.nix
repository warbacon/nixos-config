{ lib, ... }:
{
  home-manager.users.warbacon.programs.starship = {
    enable = true;
    enableFishIntegration = false;
    enableBashIntegration = false;

    settings = {
      add_newline = false;

      format = lib.concatStrings [
        "$username"
        "$shell"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_status"
        "$jobs"
        "$line_break"
        "$status"
        "$character"
      ];

      shell = {
        disabled = false;
        style = "white";
        fish_indicator = "󰈺";
        bash_indicator = "";
        zsh_indicator = "󰏰";
        powershell_indicator = "󰨊";
        nu_indicator = "󰞷";
      };

      directory = {
        read_only = " 󰌾";
        truncation_length = 0;
        truncate_to_repo = false;
        style = "cyan";
        repo_root_style = "bold bright-cyan";
      };

      git_branch = {
        format = "[\\($branch\\)]($style) ";
      };

      git_commit = {
        tag_disabled = false;
        tag_symbol = " • ";
      };

      fill = {
        style = "bright-black";
      };

      status = {
        disabled = false;
        format = "[$status]($style) ";
      };

      character = {
        success_symbol = "[>](bold yellow)";
        error_symbol = "[>](bold red)";
        vimcmd_symbol = "[>](bold yellow)";
      };
    };
  };
}
