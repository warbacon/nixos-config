{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Joaquín Guerra";
    userEmail = "45147327+warbacon@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      diff.tool = "nvim_difftool";
      difftool."nvim_difftool".cmd = ''
        nvim -c "packadd nvim.difftool" -c "DiffTool $LOCAL $REMOTE"
      '';
    };
  };

  programs.gh = {
    enable = true;
    extensions = [ pkgs.gh-markdown-preview ];
  };
}
