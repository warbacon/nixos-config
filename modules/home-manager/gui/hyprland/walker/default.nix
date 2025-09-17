{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.elephant.enable = true;

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
        close = "Escape";
        quick_activate = [
          "alt 1"
          "alt 2"
          "alt 3"
        ];

      };
      providers = {
        default = [
          "desktopapplications"
          "calc"
        ];
        empty = [ "desktopapplications" ];
      };
    };
  };

  xdg.configFile."walker/themes" = {
    source = ./themes;
    recursive = true;
  };
}
