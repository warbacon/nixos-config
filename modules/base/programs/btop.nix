{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ btop-rocm ];

  home-manager.users.warbacon.programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;
    settings = {
      color_theme = "TTY";
      theme_background = false;
      rounded_corners = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };
}
