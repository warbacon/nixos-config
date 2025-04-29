{
  home-manager.users.warbacon = {
    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          before_sleep_cmd = "loginctl lock-session";
        };
        listener = [
          {
            timeout = 60;
            on-timeout = "~/.config/hypr/scripts/dim_screen.sh";
            on-resume = "brightnessctl -r";
          }
          {
            timeout = 180;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
          {
            timeout = 300;
            on-timeout = "systemctl suspend";
          }
        ];
      };
    };
  };
}
