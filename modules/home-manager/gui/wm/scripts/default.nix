{ pkgs, lib, ... }:
let
  scriptDir = ./.;
  allFiles = builtins.readDir scriptDir;

  scripts = builtins.filter (x: x != null) (
    builtins.attrValues (
      builtins.mapAttrs (
        name: type:
        if type == "regular" && builtins.match ".*\\.sh" name != null then
          pkgs.writeScriptBin (builtins.replaceStrings [ ".sh" ] [ "" ] name) (
            lib.concatStrings [
              "#!${pkgs.dash}/bin/dash"
              "\n"
              (builtins.readFile (scriptDir + "/${name}"))
            ]
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
    pkgs.jq
    pkgs.satty
    pkgs.slurp
  ]
  ++ scripts;
}
