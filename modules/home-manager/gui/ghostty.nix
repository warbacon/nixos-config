{ pkgs, inputs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;
    installVimSyntax = true;
    settings = {
      # Shell
      command = "fish";

      # Font
      font-family = "monospace";
      font-size = 14;

      # Appearance
      theme = "tokyonight-night";

      # Behavior
      mouse-hide-while-typing = true;
      resize-overlay = "never";

      # Keybinds
      keybind = [
        "ctrl+shift+s=paste_from_selection"
      ];
    };
    themes = {
      tokyonight-night = {
        palette = [
          "0=#15161e"
          "1=#f7768e"
          "2=#9ece6a"
          "3=#e0af68"
          "4=#7aa2f7"
          "5=#bb9af7"
          "6=#7dcfff"
          "7=#a9b1d6"
          "8=#414868"
          "9=#ff899d"
          "10=#9fe044"
          "11=#faba4a"
          "12=#8db0ff"
          "13=#c7a9ff"
          "14=#a4daff"
          "15=#c0caf5"
        ];
        background = "#1a1b26";
        foreground = "#c0caf5";
        cursor-color = "#c0caf5";
        selection-background = "#283457";
        selection-foreground = "cell-foreground";
      };
    };
  };
}
