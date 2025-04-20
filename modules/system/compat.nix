{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run-free
  ];

  # Nix-ld
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
    ];
  };
}
