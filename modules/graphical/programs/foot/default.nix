{
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
          font = "Cascadia Code:size=14, Symbols Nerd Font:size=14";
          font-bold = "Cascadia Code:size=14:style=Bold, Symbols Nerd Font:size=14,style=Regular";
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
        mouse-bindings = {
          select-begin-block = "Alt+BTN_LEFT";
        };
        tweak = {
          font-monospace-warn = "no";
        };
      };
    };
  };
}
