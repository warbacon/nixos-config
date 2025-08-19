{ config, pkgs, ... }:
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
  environment.systemPackages = [
    pkgs.brightnessctl
    pkgs.fyi
    pkgs.grim
    pkgs.hyprpicker
    pkgs.libcanberra-gtk3
    pkgs.slurp
  ]
  ++ scripts
  ++ [ (if config.programs.hyprland.enable then pkgs.hyprsunset else pkgs.gammastep) ];

  home-manager.users.warbacon.xdg.desktopEntries.gammastep-indicator = {
    name = "gammastep-indicator";
    noDisplay = true;
  };
}
