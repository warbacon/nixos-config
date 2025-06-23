{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.chafa
  ];

  home-manager.users.warbacon = {
    xdg.configFile."foot/themes" = {
      source = ./themes;
      recursive = true;
    };

    programs.foot = {
      enable = true;
      server.enable = true;
      settings = {
        main = {
          include = "~/.config/foot/themes/tokyonight_night.ini";
          font = "monospace:size=14";
          font-size-adjustment = 2;
          resize-delay-ms = 0;
        };
        cursor = {
          blink = "yes";
        };
        key-bindings = {
          primary-paste = "Control+Shift+s";
          spawn-terminal = "Control+Shift+d";
        };
        tweak = {
          font-monospace-warn = "no";
        };
      };
    };
  };
}
