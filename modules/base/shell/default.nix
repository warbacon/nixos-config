{ lib, hostName, ... }:
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
    nrb = "sudo nixos-rebuild test --flake \"$HOME/Git/nixos-config#${hostName}\"";
    nrs = "sudo nixos-rebuild switch --flake \"$HOME/Git/nixos-config#${hostName}\"";
    nrt = "sudo nixos-rebuild test --flake \"$HOME/Git/nixos-config#${hostName}\"";
    rm = "rm -v";
    rt = "trash";
  };

  environment.variables = {
    MANPAGER = "nvim +Man!";
    FZF_DEFAULT_OPTS = ''
      --highlight-line \
      --info=inline-right \
      --ansi \
      --layout=reverse \
      --border=none \
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

  programs.direnv.enable = true;
  programs.command-not-found.enable = false;
  home-manager.users.warbacon.programs.dircolors.enable = true;
}
