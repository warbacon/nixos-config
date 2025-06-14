{
  home-manager.users.warbacon = {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/.config/background" ];
        wallpaper = [ ",~/.config/background" ];
      };
    };
  };
}
