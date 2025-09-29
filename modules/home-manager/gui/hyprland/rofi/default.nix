{
  programs.rofi = {
    enable = true;
    theme = ./themes/tokyonight.rasi;
    extraConfig = {
      drun-match-fields = "name,exec";
      drun-display-format = "{name}";
      run-cmd = "app2unit -- {cmd}";
    };
  };
}
