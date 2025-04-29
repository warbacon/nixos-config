{
  home-manager.users.warbacon.programs.bash = {
    enable = true;
    initExtra = (builtins.readFile ./config.sh);
    bashrcExtra = (builtins.readFile ./init.sh);
  };
}
