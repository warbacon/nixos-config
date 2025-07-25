{
  home-manager.users.warbacon.programs.firefox = {
    enable = true;
    languagePacks = [ "es-ES" ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      RequestedLocales = "es-ES";
    };
    profiles = {
      personal = {
        settings = {
          "apz.fling_friction" = 0.004;
          "apz.gtk.pangesture.delta_mode" = 2;
          "apz.gtk.pangesture.pixel_delta_mode_multiplier" = 25;
          "middlemouse.paste" = false;
        };
      };
    };
  };
}
