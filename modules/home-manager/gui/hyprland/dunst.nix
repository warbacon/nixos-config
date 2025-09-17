{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "monospace 10";

        width = 300;
        height = 100;

        offset = "(12, 12)";
        gap_size = 10;

        frame_width = 1;
        corner_radius = 7;

        follow = "mouse";

        dmenu = "walker -d";

        mouse_left_click="do_action, remove_current";
        mouse_middle_click="remove_current";
        mouse_right_click="context, remove_current";
      };
    };
  };
}
