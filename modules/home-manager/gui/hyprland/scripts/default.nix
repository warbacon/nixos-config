{ pkgs, ... }:
let
  scriptDir = ./.;
  allFiles = builtins.readDir scriptDir;

  scripts = builtins.filter (x: x != null) (
    builtins.attrValues (
      builtins.mapAttrs (
        name: type:
        if type == "regular" && builtins.match ".*\\.sh" name != null then
          pkgs.writeShellScriptBin (builtins.replaceStrings [ ".sh" ] [ "" ] name) (
            builtins.readFile (scriptDir + "/${name}")
          )
        else
          null
      ) allFiles
    )
  );
in
{
  home.packages = [
    pkgs.brightnessctl
    pkgs.fyi
    pkgs.grim
    pkgs.hyprpicker
    pkgs.hyprsunset
    pkgs.jq
    pkgs.satty
    pkgs.slurp
    (pkgs.writeShellScriptBin "play-sound" # bash
      ''
        ${pkgs.mpv}/bin/mpv --really-quiet "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo/$1.oga"
      ''
    )
  ]
  ++ scripts;
}
