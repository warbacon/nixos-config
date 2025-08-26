{
  programs.git = {
    enable = true;
    userName = "Joaquín Guerra";
    userEmail = "45147327+warbacon@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh.enable = true;
}
