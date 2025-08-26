{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    defaultEditor = true;
  };

  environment.variables = {
    MANPAGER = "nvim +Man!";
  };
}
