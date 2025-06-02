{ pkgs, ... }:
{

  environment.systemPackages = [
    pkgs.poppler
    pkgs.resvg
  ];

  home-manager.users.warbacon.programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;

    theme.flavor.dark = "tokyonight";
    flavors = {
      tokyonight = ./flavors/tokyonight.yazi;
    };

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
        sort_translit = false;
      };

      preview = {
        tab_size = 4;
        max_width = 1000;
        max_height = 1000;
      };

      opener = {
        open = [
          {
            run = "xdg-open \"$1\"";
            orphan = true;
            desc = "Open";
            for = "linux";
          }
          {
            run = "start \"\" \"%1\"";
            orphan = true;
            desc = "Open";
            for = "windows";
          }
        ];
      };
    };

    keymap = {
      mgr.prepend_keymap = [
        {
          on = [
            "g"
            "d"
          ];
          run = "cd ~/Descargas";
          desc = "Goto ~/Descargas";
        }
        {
          on = [
            "g"
            "x"
          ];
          run = "plugin extract";
          desc = "Extract file";
        }
      ];
    };
  };
}
