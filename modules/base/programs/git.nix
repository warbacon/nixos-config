{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gh
    git
    lazygit
  ];

  home-manager.users.warbacon = {
    programs.git = {
      enable = true;
      userName = "Joaquín Guerra";
      userEmail = "45147327+warbacon@users.noreply.github.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    programs.gh.enable = true;

    programs.lazygit = {
      enable = true;
      settings = {
        disableStartupPopups = true;

        os.editPreset = "nvim";

        gui = {
          nerdFontsVersion = "3";
          showBottomLine = false;
          showRandomTip = false;

          spinner = {
            rate = 80;
            frames = [
              "⠋"
              "⠙"
              "⠹"
              "⠸"
              "⠼"
              "⠴"
              "⠦"
              "⠧"
              "⠇"
              "⠏"
            ];
          };

          theme = {
            activeBorderColor = [
              "#ff9e64"
              "bold"
            ];
            inactiveBorderColor = [ "#27a1b9" ];
            searchingActiveBorderColor = [
              "#ff9e64"
              "bold"
            ];
            optionsTextColor = [ "#7aa2f7" ];
            selectedLineBgColor = [ "#283457" ];
            cherryPickedCommitFgColor = [ "#7aa2f7" ];
            cherryPickedCommitBgColor = [ "#bb9af7" ];
            markedBaseCommitFgColor = [ "#7aa2f7" ];
            markedBaseCommitBgColor = [ "#e0af68" ];
            unstagedChangesColor = [ "#db4b4b" ];
            defaultFgColor = [ "#c0caf5" ];
          };
        };
      };
    };
  };
}
