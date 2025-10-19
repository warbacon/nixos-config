{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "Joaquín Guerra";
        email = "45147327+warbacon@users.noreply.github.com";
      };
    };
  };

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-markdown-preview ];
  };
}
