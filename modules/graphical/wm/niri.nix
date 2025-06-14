{ pkgs, ... }:
{
  programs.niri.enable = true;

  # Packages
  environment.systemPackages = [
    pkgs.nautilus
    pkgs.file-roller
    pkgs.xwayland-satellite
  ];

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

  services.gnome.sushi.enable = true;
  services.gvfs.enable = true;
  # home-manager.users.warbacon.programs.fish.loginShellInit = # fish
  #   ''
  #     if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" -eq 1
  #       exec niri-session
  #     end
  #   '';
}
