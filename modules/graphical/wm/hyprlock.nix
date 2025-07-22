{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.hyprlock ];

  home-manager.users.warbacon = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          ignore_empty_input = true;
        };

        background = {
          path = "~/.config/background";
          blur_passes = 4;
          brightness = 0.75;
        };

        label = [
          {
            text = "cmd[update:0:1] echo $(date +\"%A, %d de %B\")";
            color = "rgba(255,255,255,0.5)";
            font_size = 40;
            font_family = "sans Medium";

            position = "0, -250";
            halign = "center";
            valign = "top";
          }
          {
            text = "$TIME";
            color = "rgba(255,255,255,0.5)";
            font_size = 175;
            font_family = "sans Bold";

            position = "0, -300";
            halign = "center";
            valign = "top";
          }
        ];

        input-field = [
          {
            dots_size = 0.3;
            outer_color = "rgba(255,255,255,0.1)";
            inner_color = "rgba(25,25,25,0.5)";
            font_color = "rgba(255,255,255,0.5)";
            placeholder_text = "";
            fail_text = "";
            check_color = "rgb(f6c177)";
            fail_color = "rgb(eb6f92)";

            size = "300, 100";
            position = "0, 150";
            halign = "center";
            valign = "bottom";
          }
        ];
      };
    };
  };
}
