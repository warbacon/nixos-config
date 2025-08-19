{ pkgs, inputs, ... }:
{
  home-manager.users.warbacon = {
    programs.ghostty = {
      enable = true;
      package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
      installVimSyntax = true;
      settings = {
        # Font
        font-family = "monospace";
        font-size = 14;
        adjust-cursor-thickness = 3;

        # Appearance
        theme = "tokyonight_night";

        # Behavior
        mouse-hide-while-typing = true;
        resize-overlay = "never";

        # Keybinds
        keybind = [
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
