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
    cp = "cp -iv";
    ff = "fastfetch";
    lg = "lazygit";
    mv = "mv -iv";
    nrs = "sudo nixos-rebuild switch --flake \"$HOME/Git/nixos-config#${hostname}\"";
    rm = "rm -v";
    rt = "trash";
  };

  programs.command-not-found.enable = false;
}
