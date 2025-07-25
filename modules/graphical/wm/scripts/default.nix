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
  environment.systemPackages = [
    pkgs.brightnessctl
    pkgs.entr
    pkgs.fyi
    pkgs.grim
    pkgs.hyprpicker
    pkgs.gammastep
    pkgs.libcanberra-gtk3
    pkgs.slurp
  ] ++ scripts;

  home-manager.users.warbacon.xdg.desktopEntries.gammastep-indicator = {
    name = "gammastep-indicator";
    noDisplay = true;
  };
}
