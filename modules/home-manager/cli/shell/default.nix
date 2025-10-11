{
  imports = [
    ./fish
    ./bash
  ];

  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };
  programs.dircolors.enable = true;

  home.sessionVariables = {
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
}
