{ pkgs, lib, ... }:
{
  services.displayManager.gdm.enable = true;

  services.desktopManager.gnome.enable = true;
  services.gnome.core-apps.enable = false;

  services.gnome.evolution-data-server.enable = lib.mkForce false;
  services.gnome.localsearch.enable = lib.mkForce false;

  environment.gnome.excludePackages = [
    pkgs.gnome-tour
    pkgs.orca
  ];
}
