{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.bottles.override { removeWarningPopup = true; })
    pkgs.gamescope
  ];

  hardware.graphics = {
    enable32Bit = true;
  };
}
