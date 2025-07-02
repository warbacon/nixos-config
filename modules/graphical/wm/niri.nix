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
    terminal = "foot";
  };

  services.gvfs.enable = true;
  home-manager.users.warbacon.programs.fish.loginShellInit = # fish
    ''
      if test -z "$WAYLAND_DISPLAY"; and test "$XDG_VTNR" -eq 1
        # Reset failed state of all user units.
        systemctl --user reset-failed

        # Import the login manager environment.
        systemctl --user import-environment

        # DBus activation environment is independent from systemd. While most of
        # dbus-activated services are already using `SystemdService` directive, some
        # still don't and thus we should set the dbus environment with a separate
        # command.
        dbus-update-activation-environment --all

        # Start niri and wait for it to terminate.
        systemctl --user --wait start niri.service

        # Force stop of graphical-session.target.
        systemctl --user start --job-mode=replace-irreversibly niri-shutdown.target

        # Unset environment that we've set.
        systemctl --user unset-environment WAYLAND_DISPLAY XDG_SESSION_TYPE XDG_CURRENT_DESKTOP NIRI_SOCKET
      end
    '';
}
