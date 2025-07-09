{
  home-manager.users.warbacon = {
    services.mako = {
      enable = true;
      extraConfig = (builtins.readFile ./config.ini);
    };
  };
}
