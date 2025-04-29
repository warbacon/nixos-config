{
  home-manager.users.warbacon.programs.bash = {
    enable = true;
    initExtra = (builtins.readFile ./bashrc);
    shellOptions = [ "autocd" ];
  };
}
