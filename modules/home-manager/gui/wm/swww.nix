{ pkgs, ... }:
{
  services.swww.enable = true;
  systemd.user.services.watch-background = {
    Unit.Description = "Reload background using swww";
    Service = {
      Type = "oneshot";
      PassEnvironment = [
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "SWWW_SOCKET"
        "XDG_RUNTIME_DIR"
        "DBUS_SESSION_BUS_ADDRESS"
      ];
      ExecStart = "${pkgs.swww}/bin/swww img %h/.config/background --transition-type=grow --transition-fps=90 --transition-duration=2";
    };
  };

  systemd.user.paths.watch-background = {
    Unit = {
      Description = "Watch for changes in background file";
      Requires = [ "watch-background.service" ];
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Path = {
      PathChanged = "%h/.config/background";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
