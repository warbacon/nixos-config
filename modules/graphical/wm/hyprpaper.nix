{
  home-manager.users.warbacon = {
    services.hyprpaper = {
      enable = true;
      settings = {
        preload = [ "~/.config/hypr/wallpaper.png" ];
        wallpaper = [ ",~/.config/hypr/wallpaper.png" ];
      };
    };
  };
}
