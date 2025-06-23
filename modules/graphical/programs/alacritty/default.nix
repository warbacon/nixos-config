{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.ueberzugpp
  ];

  home-manager.users.warbacon = {
    xdg.configFile."alacritty/themes" = {
      source = ./themes;
      recursive = true;
    };
    programs.alacritty = {
      enable = true;
      settings = {
        general.import = [
          "themes/tokyonight_night.toml"
        ];
        font = {
          normal.family = "monospace";
          size = 14;
        };
        terminal.shell = "fish";
        cursor.style.blinking = "On";
        keyboard.bindings = [
          {
            key = "Plus";
            mods = "Control";
            action = "IncreaseFontsize";
          }
          {
            key = "Plus";
            mods = "Control";
            action = "IncreaseFontsize";
          }
          {
            key = "Plus";
            mods = "Control";
            action = "IncreaseFontsize";
          }
          {
            key = "Plus";
            mods = "Control";
            action = "IncreaseFontsize";
          }
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontsize";
          }
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontsize";
          }
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontsize";
          }
          {
            key = "Minus";
            mods = "Control";
            action = "DecreaseFontsize";
          }
          {
            key = "S";
            mods = "Control|Shift";
            action = "PasteSelection";
          }
          {
            key = "D";
            mods = "Control|Shift";
            action = "CreateNewWindow";
          }
        ];
      };
    };
  };
}
