{ pkgs, ... }:
let
  scriptDir = ./.;
  allFiles = builtins.readDir scriptDir;

  scripts = builtins.attrValues (
    builtins.mapAttrs (
      name: type:
      if type == "regular" && builtins.match ".*\\.sh" name != null then
        pkgs.writeShellScriptBin (builtins.replaceStrings [ ".sh" ] [ "" ] name) (
          builtins.readFile (scriptDir + "/${name}")
        )
      else
        null
    ) allFiles
  );

  filteredScripts = builtins.filter (x: x != null) scripts;
in
{
  environment.systemPackages = filteredScripts;
}
