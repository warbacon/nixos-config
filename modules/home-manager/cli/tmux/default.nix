{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    extraConfig = builtins.readFile ./tmux.conf;
  };
}
