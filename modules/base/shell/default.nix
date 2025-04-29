{
  lib,
  hostname,
  ...
}:
{
  imports = [
    ./fish
    ./bash
  ];

  environment.shellAliases = lib.mkForce {
    nrs = "sudo nixos-rebuild switch --flake \"$HOME/Git/nixos-config#${hostname}\"";
  };

  programs.command-not-found.enable = false;
}
