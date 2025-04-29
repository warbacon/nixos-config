{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.kitty ];

  home-manager.users.warbacon = {
    programs.kitty = {
      enable = true;
      shellIntegration = {
        enableBashIntegration = true;
        enableFishIntegration = true;
      };
      font = {
        name = "monospace";
        size = 14;
      };
      settings = {
        # Font
        disable_ligatures = "cursor";
        undercurl_style = "thick-sparse";

        # Shell
        shell = "fish";

        # General
        mouse_hide_wait = -1;
        strip_trailing_spaces = "always";
        notify_on_cmd_finish = "invisible 10.0";
        placement_strategy = "top-left";
        # cursor_trail = 3;

        # Performance
        wayland_enable_ime = "no";
        repaint_delay = 11;
        input_delay = 1;
        sync_to_monitor = "no";

        # Tabs
        tab_bar_edge = "top";
        tab_bar_align = "center";
        tab_bar_style = "fade";
        tab_fade = 1;
        tab_title_template = "{index}:{title}";

        remember_window_size = "no";
        initial_window_width = 1200;
        initial_window_height = 650;

        enabled_layouts = "fat,stack";

        mouse_map = "alt+left press ungrabbed mouse_selection rectangle";
      };
      keybindings = {
        "ctrl+shift+d" = "new_tab_with_cwd";

        "ctrl+0" = "change_font_size current 0";
        "ctrl+plus" = "change_font_size current +2.0";
        "ctrl+minus" = "change_font_size current -2.0";

        "ctrl+shift+equal" = "no_op";
        "ctrl+shift+plus" = "no_op";
        "ctrl+shift+minus" = "no_op";

        "alt+1" = "goto_tab 1";
        "alt+2" = "goto_tab 2";
        "alt+3" = "goto_tab 3";
        "alt+4" = "goto_tab 4";
        "alt+5" = "goto_tab 5";
        "alt+6" = "goto_tab 6";
        "alt+7" = "goto_tab 7";
        "alt+8" = "goto_tab 8";
        "alt+9" = "goto_tab 9";
        "alt+0" = "goto_tab 10";

        "ctrl+alt+k" = "neighboring_window up";
        "ctrl+alt+l" = "neighboring_window right";
        "ctrl+alt+j" = "neighboring_window down";
        "ctrl+alt+h" = "neighboring_window left";
      };
      extraConfig = # bash
        ''
          # Font
          modify_font cell_height 8px
          modify_font strikethrough_position 4px

          # Theme
          include ./Tokyo Night.conf
        '';
    };

    xdg.configFile."kitty/Tokyo Night.conf" = {
      source = ./tokyonight.conf;
    };
  };
}
