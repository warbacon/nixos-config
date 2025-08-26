{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.mode = null;
    extraConfig = builtins.readFile ./kitty.conf;
  };

  xdg.configFile."kitty/themes" = {
    source = ./themes;
    recursive = true;
  };
}
