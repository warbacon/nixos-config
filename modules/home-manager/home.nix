{ osConfig, lib, ... }:
{
  imports = [
    ./cli
  ]
  ++ lib.optionals (osConfig.this.desktop != null) [
    ./gui
  ];

  home = {
    preferXdgDirectories = true;
    stateVersion = osConfig.system.stateVersion;
  };
}
