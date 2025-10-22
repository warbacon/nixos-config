{ pkgs, ... }:
{
  programs.bash.profileExtra = # bash
    ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  xdg.configFile."uwsm/env".text = # bash
    ''
      export GDK_SCALE=2
    '';

  xdg.portal = {
    enable = true;
    config = {
      hyprland = {
        default = "hyprland;gnome";
      };
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
    ];
  };
}
