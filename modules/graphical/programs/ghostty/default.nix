{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.chafa ];
  home-manager.users.warbacon = {
    programs.ghostty = {
      enable = true;
      installVimSyntax = true;
      settings = {
        # Font
        font-family = "monospace";
        font-size = 14;
        adjust-cell-height = "30%";
        adjust-underline-position = 5;
        adjust-cursor-height = "30%";
        adjust-cursor-thickness = 3;

        # Appearance
        theme = "tokyonight_night";
        window-padding-x = 0;
        window-padding-y = 0;
        window-theme = "ghostty";

        # Behavior
        cursor-click-to-move = false;
        mouse-hide-while-typing = true;
        resize-overlay = "never";
        shell-integration-features = "no-cursor";

        # Keybinds
        keybind = [
          "ctrl+shift+semicolon=reload_config"
          "ctrl+plus=increase_font_size:2"
          "ctrl+minus=decrease_font_size:2"
          "ctrl+shift+s=paste_from_selection"
        ];
      };
    };

    xdg.configFile."ghostty/themes" = {
      recursive = true;
      source = ./themes;
    };
  };
}
