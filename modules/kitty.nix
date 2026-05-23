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
        tab_bar_style powerline
        tab_powerline_style slanted
        tab_bar_edge top
        palette_generate legacy

        # Window
        # placement_strategy top-left
        # window_padding_width 2

        # Performance
        wayland_enable_ime no
        resize_debounce_time 0.0 0.0
        input_delay 0
        sync_to_monitor no

        # Scrolling
        momentum_scroll 0

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
        foreground oklch(0.8500 0.0250 290.0)
        background oklch(0.2100 0.0280 290.0)
        selection_foreground none
        selection_background oklch(0.3485 0.0441 256.5)
        cursor oklch(0.8500 0.0250 290.0)
        cursor_text_color oklch(0.2100 0.0280 290.0)

        # Black
        color0 oklch(0.2900 0.0430 290.0)
        color8 oklch(0.5000 0.0500 290.0)

        # Red
        color1 oklch(0.7000 0.1500 4.0)
        color9 oklch(0.7600 0.1500 4.0)

        # Green
        color2 oklch(0.7700 0.1000 141.0)
        color10 oklch(0.8300 0.1000 141.0)

        # Yellow
        color3 oklch(0.8400 0.1100 77.0)
        color11 oklch(0.9000 0.1100 77.0)

        # Blue
        color4 oklch(0.7000 0.1000 228.0)
        color12 oklch(0.7600 0.1000 228.0)

        # Magenta
        color5 oklch(0.7700 0.1100 304.0)
        color13 oklch(0.8300 0.1300 304.0)

        # Cyan
        color6 oklch(0.8200 0.0600 209.0)
        color14 oklch(0.8800 0.0600 209.0)

        # White
        color7 oklch(0.6500 0.0500 290.0)
        color15 oklch(0.8500 0.0250 290.0)
      '';
  };
}
