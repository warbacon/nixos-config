{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  services.hypridle.settings.listener = [
    {
      timeout = 180;
      on-timeout = "niri msg action power-off-monitors";
      on-resume = "niri msg action power-on-monitors";
    }
  ];
}
