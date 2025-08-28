{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      # GENERAL
      keep-open = true;
      keep-open-pause = false;
      save-position-on-quit = true;
      watch-later-options-remove = [
        "fullscreen"
        "mute"
      ];
      autofit-larger = "80%x85%";
      autofit-smaller = "1280x720";

      # VIDEO
      vo = "gpu-next";
      gpu-api = "vulkan";
      scale = "linear";
      tscale = "oversample";
      video-sync = "display-resample";
    };
    scripts = [
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.modernz
    ];
  };
}
