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
      hide_quick_activation = true;
      # theme = "tokyonight";

      placeholders = {
        default = {
          input = "Escribe algo...";
          list = "Sin resultados";
        };
      };

      keybinds = {
        previous = ["Up" "ctrl k"];
        next = ["Down" "ctrl j"];
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
