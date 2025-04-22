{ pkgs, ... }:
{
  home-manager.users.warbacon.programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;
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
