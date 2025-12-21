{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      # GENERAL
      keep-open = "always";
      keep-open-pause = false;
      save-position-on-quit = true;
      watch-later-options = [
        "start"
      ];

      # VIDEO
      vo = "gpu-next";
      hwdec = true;
      video-sync = "display-resample";
      tscale = "oversample";
      scale = "bilinear";

      # SUBTITLES
      slang = "es-ES,es,spa";
      sub-auto = "fuzzy";
      subs-with-matching-audio = "forced";
      sub-fix-timing = true;
      blend-subtitles = true;
      demuxer-mkv-subtitle-preroll = true;

      # AUDIO
      alang = "ja,jp,jpn,en,eng,es-ES,es,spa";

      # SCREENSHOTS
      screenshot-format = "png";

      # UOSC
      osd-bar = false;
    };
    bindings = {
      "tab" = "script-binding uosc/toggle-ui";

      "right" = "seek 5; script-binding uosc/flash-timeline";
      "left" = "seek -5; script-binding uosc/flash-timeline";
      "shift+right" = "seek 30; script-binding uosc/flash-timeline";
      "shift+left" = "seek -30; script-binding uosc/flash-timeline";

      "up" = "seek 30; script-binding uosc/flash-timeline";
      "down" = "seek -30; script-binding uosc/flash-timeline";
      "shift+down" = "seek -5; script-binding uosc/flash-timeline";
      "shift+up" = "seek 5; script-binding uosc/flash-timeline";

      "ctrl+right" =
        "no-osd add chapter 1; script-binding uosc/flash-timeline; script-binding uosc/flash-top-bar";
      "ctrl+left" =
        "no-osd add chapter -1; script-binding uosc/flash-timeline; script-binding uosc/flash-top-bar";

      "m" = "no-osd cycle mute; script-binding uosc/flash-volume";
      "WHEEL_UP" = "no-osd add volume 2; script-binding uosc/flash-volume";
      "WHEEL_DOWN" = "no-osd add volume -2; script-binding uosc/flash-volume";

      "[" = "no-osd add speed -0.25; script-binding uosc/flash-speed";
      "]" = "no-osd add speed 0.25; script-binding uosc/flash-speed";
      "{" = "no-osd add speed -0.5; script-binding uosc/flash-speed";
      "}" = "no-osd add speed 0.5; script-binding uosc/flash-speed";

      "ctrl+p" = "script-binding uosc/menu";
      "menu" = "script-binding uosc/menu";

      "ctrl+o" = "script-binding uosc/open-file";
    };
    scripts = [
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.uosc
    ];
  };
}
