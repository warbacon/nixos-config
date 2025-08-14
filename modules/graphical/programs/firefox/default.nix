{
  home-manager.users.warbacon.programs.firefox = {
    enable = true;
    languagePacks = [ "es-ES" ];
    policies = {
      DisableTelemetry = true;
    };
    profiles = {
      default = {
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };
}
