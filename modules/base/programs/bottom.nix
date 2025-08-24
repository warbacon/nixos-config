{ hostName, ... }:
{
  home-manager.users.warbacon.programs.bottom = {
    enable = true;
    settings = {
      flags = {
        battery = hostName == "zenix";
        disable_gpu = hostName == "nixwsl";
        process_memory_as_value = true;
        network_use_bytes = true;
      };
      processes = {
        columns =
          if hostName != "nixwsl" then
            [
              "PID"
              "Name"
              "CPU%"
              "GPU%"
              "Mem%"
              "GMem%"
              "User"
              "R/s"
              "W/s"
              "T.Read"
              "T.Write"
            ]
          else
            [
              "PID"
              "Name"
              "CPU%"
              "Mem%"
              "User"
              "R/s"
              "W/s"
              "T.Read"
              "T.Write"
            ];
      };
      styles.widgets = {
        border_color = "#449dab";
        selected_border_color = "#ff9e64";
        selected_text = {
          color = "white";
          bg_color = "#283457";
          bold = true;
        };
        widget_border_type = "rounded";
        widget_title = {
          color = "white";
          bold = true;
        };
      };
    };
  };
}
