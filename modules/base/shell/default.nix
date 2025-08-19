{ lib, hostName, ... }:
{
  imports = [
    ./fish
    ./bash
    ./starship.nix
  ];

  environment.shellAliases = lib.mkForce {
    cp = "cp -iv";
    ff = "fastfetch";
    lg = "lazygit";
    mv = "mv -iv";
    nrb = "sudo nixos-rebuild boot --flake \"$FLAKE_DIR#${hostName}\"";
    nrs = "sudo nixos-rebuild switch --flake \"$FLAKE_DIR#${hostName}\"";
    nrt = "sudo nixos-rebuild test --flake \"$FLAKE_DIR#${hostName}\"";
    rm = "rm -v";
    rt = "trash";
  };

  environment.variables = {
    FLAKE_DIR = "\"$HOME/Git/nixos-config\"";
    MANPAGER = "nvim +Man!";
    FZF_DEFAULT_OPTS = ''
      --ansi \
      --highlight-line \
      --info=inline-right \
      --color=bg+:#283457 \
      --color=bg:#16161e \
      --color=border:#27a1b9 \
      --color=fg:#c0caf5 \
      --color=fg+:#c0caf5 \
      --color=gutter:#16161e \
      --color=header:#ff9e64 \
      --color=hl+:#2ac3de \
      --color=hl:#2ac3de \
      --color=info:#545c7e \
      --color=marker:#ff007c \
      --color=pointer:#ff007c \
      --color=prompt:#2ac3de \
      --color=query:#c0caf5:regular \
      --color=scrollbar:#27a1b9 \
      --color=separator:#ff9e64 \
      --color=spinner:#ff007c
    '';
  };

  home-manager.users.warbacon.programs.dircolors.enable = true;
}
