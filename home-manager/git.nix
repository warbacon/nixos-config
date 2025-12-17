{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "joaquinguerratocino@gmail.com";
        name = "Joaquín Guerra";
      };
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-markdown-preview ];
  };
}
