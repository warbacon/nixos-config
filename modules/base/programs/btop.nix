{ pkgs, hostname, ... }:
{
  home-manager.users.warbacon.programs.btop = {
    enable = true;
    package = if hostname != "nixwsl" then pkgs.btop-rocm else pkgs.btop;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };
}
