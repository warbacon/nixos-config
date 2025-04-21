{
  home-manager.users.warbacon.programs.firefox = {
    enable = true;
    languagePacks = [ "es-ES" ];
    policies = {
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxStudies = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      RequestedLocales = "es-ES";
    };
  };
}
