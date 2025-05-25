{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.steam-run-free
  ];

  # Nix-ld
  programs.nix-ld = {
    enable = true;
    libraries =  [
      pkgs.stdenv.cc.cc.lib
    ];
  };
}
