{
  programs.rofi = {
    enable = true;
    theme = ./themes/tokyonight.rasi;
    extraConfig = {
      drun-match-fields = "name,exec";
    };
  };
}
