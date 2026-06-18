{ pkgs, hostName, ... }:
{
  home-manager.users.warbacon = {
    programs.mpv = {
      enable = true;
      scripts = [
        pkgs.mpvScripts.autoload
        pkgs.mpvScripts.modernz
        pkgs.mpvScripts.thumbfast
      ];
    };

    xdg.configFile = {
      "mpv/mpv.conf".text = # ini
        ''
          save-position-on-quit=yes
          watch-later-options=start
          keep-open=yes
          keep-open-pause=no

          osd-font=monospace

          ${if hostName != "zenix" then "profile=high-quality" else "scale=bicubic"}

          slang=es-ES,es,spa
        '';
      "mpv/input.conf".text = ''
        Ctrl+LEFT add chapter -1
        Ctrl+RIGHT add chapter 1
        Shift+MBTN_RIGHT script-binding select/context-menu
      '';
      "mpv/scripts".source = ./scripts;
      "mpv/script-opts".source = ./script-opts;
    };
  };
}
