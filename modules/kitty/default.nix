{ hostName, ... }:
{
  home-manager.users.warbacon.programs.kitty = {
    enable = true;
    extraConfig = # kitty
      ''
        # Shell
        shell fish

        # Font
        font_family monospace
        font_size ${if hostName == "zenix" then "14" else "18"}
        disable_ligatures cursor

        # Appearance
        undercurl_style thick-sparse
        tab_title_template {index}:{title}
        tab_fade 1
        tab_bar_edge top
        tab_bar_show_new_tab_button yes
        palette_generate legacy
        cursor_trail 3

        # Performance
        wayland_enable_ime no
        resize_debounce_time 0.0 0.0
        input_delay 0
        sync_to_monitor no

        # Mappings
        mouse_map alt+left press ungrabbed mouse_selection rectangle

        map kitty_mod+p command_palette
        map kitty_mod+d new_tab_with_cwd

        map ctrl+0 change_font_size current 0
        map ctrl+plus change_font_size current +2.0
        map ctrl+minus change_font_size current -2.0
        map kitty_mod+equal no_op
        map kitty_mod+plus no_op
        map kitty_mod+minus no_op

        map alt+1 goto_tab 1
        map alt+2 goto_tab 2
        map alt+3 goto_tab 3
        map alt+4 goto_tab 4
        map alt+5 goto_tab 5
        map alt+6 goto_tab 6
        map alt+7 goto_tab 7
        map alt+8 goto_tab 8
        map alt+9 goto_tab 9
        map alt+0 goto_tab 10

        # Theme
        ${builtins.readFile ./pino.conf}
      '';
  };
}
