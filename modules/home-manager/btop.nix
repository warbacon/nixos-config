{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;
    settings = {
      color_theme = "tokyo-night";
      rounded_corners = false;
      update_ms = 1000;
      vim_keys = true;
    };
  };
}
