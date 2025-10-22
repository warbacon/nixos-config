{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      force_keyboard_focus = true;
      theme = "tokyonight";

      placeholders = {
        default = {
          input = "Escribe algo...";
          list = "Sin resultados";
        };
      };

      keybinds = {
        quick_activate = [ ];
        "menus:commands" = [
          {
            action = "default";
            bind = "Return";
          }
        ];

      };
      providers = {
        default = [
          "desktopapplications"
          "calc"
          "menus:commands"
        ];
        empty = [ "desktopapplications" ];
      };
    };
  };

  xdg.configFile."walker/themes" = {
    source = ./themes;
    recursive = true;
  };

  xdg.configFile."elephant/menus" = {
    source = ./menus;
    recursive = true;
  };
}
