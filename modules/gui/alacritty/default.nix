{ pkgs, ... }:
{
  home-manager.users.warbacon = {
    home.packages = [
      pkgs.alacritty
    ];

    xdg.configFile."alacritty/alacritty.toml".text = # toml
      ''
        [window]
        padding = { x = 2, y = 2 }
        dynamic_padding = true
        opacity = 0.95
        blur = true

        [font]
        size = 14

        [terminal]
        shell = "fish"

        [mouse]
        bindings = [
          { mouse = "WheelUp", mods = "Control", action = "IncreaseFontSize" },
          { mouse = "WheelDown", mods = "Control", action = "DecreaseFontSize" },
        ]

        [keyboard]
        bindings = [
          { key = "Plus", mods = "Control", action = "IncreaseFontSize" },
          { key = "Plus", mods = "Control", action = "IncreaseFontSize" },
          { key = "Plus", mods = "Control", action = "IncreaseFontSize" },
          { key = "Minus", mods = "Control", action = "DecreaseFontSize" },
          { key = "Minus", mods = "Control", action = "DecreaseFontSize" },
          { key = "Minus", mods = "Control", action = "DecreaseFontSize" },
          { key = "D", mods = "Control|Shift", action = "CreateNewWindow" },
        ]

        [colors]
        ${builtins.readFile ./pino.toml}
      '';

    xdg.terminal-exec.settings.default = [
      "Alacritty.desktop"
    ];
  };
}
