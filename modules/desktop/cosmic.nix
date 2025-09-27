{ lib, config, pkgs, ... }:
{
  config = lib.mkIf (config.this.desktop == "cosmic") {
    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;

    environment.cosmic.excludePackages = with pkgs; [
      cosmic-edit
      cosmic-player
      cosmic-store
      cosmic-term
      orca
    ];
  };
}
