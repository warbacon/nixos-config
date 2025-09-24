{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./waybar
  ];

  programs.bash.profileExtra = # bash
    ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';

  home.packages = [
    pkgs.app2unit
    pkgs.grim
    pkgs.hyprsunset
    pkgs.rofi
    pkgs.slurp
  ];

  xdg.configFile."uwsm/env".text = # bash
    ''
      export GDK_SCALE=2
      export APP2UNIT_SLICES='a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice'
    '';

  systemd.user.services.wl-clip-persist = {
    Unit = {
      Description = "wl-clip-persist";
      ConditionEnvironment = "WAYLAND_DISPLAY";
      After = [
        "graphical-session.target"
      ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "~/.config/background" ];
      wallpaper = [ ",~/.config/background" ];
    };
  };

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
