{
  home-manager.users.warbacon = {
    services.dunst = {
      enable = true;
      settings = {
        global = {
          font = "monospace 11";
          frame_width = 1;
          gap_size = 6;
          height = "(0, 100)";
          max_icon_size = 64;
          offset = "20x20";
          width = "300";
          origin = "top-right";
          corner_radius = 8;
          icon_corner_radius = 6;
          progress_bar_corner_radius = 3;

          dmenu = "rofi -dmenu";

          mouse_left_click = "do_action, close_current";
          mouse_middle_click = "close_current";
          mouse_right_click = "context, close_current";

          background = "#16161e";
          foreground = "#c0caf5";
          frame_color = "#232533";
          highlight = "#ff9e64";
        };
        urgency_critical = {
          frame_color = "#f7768e";
        };
      };
    };
  };
}
