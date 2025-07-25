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
    icat = "kitten icat";
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
    LS_COLORS = "*.7z=01;31:*.aac=00;36:*.ace=01;31:*.alz=01;31:*.arc=01;31:*.arj=01;31:*.asf=01;35:*.au=00;36:*.avi=01;35:*.bmp=01;35:*.bz=01;31:*.bz2=01;31:*.cab=01;31:*.cgm=01;35:*.cpio=01;31:*.deb=01;31:*.dl=01;35:*.dwm=01;31:*.dz=01;31:*.ear=01;31:*.emf=01;35:*.esd=01;31:*.flac=00;36:*.flc=01;35:*.fli=01;35:*.flv=01;35:*.gif=01;35:*.gl=01;35:*.gz=01;31:*.jar=01;31:*.jpeg=01;35:*.jpg=01;35:*.lha=01;31:*.lrz=01;31:*.lz=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.lzo=01;31:*.m2v=01;35:*.m4a=00;36:*.m4v=01;35:*.mid=00;36:*.midi=00;36:*.mjpeg=01;35:*.mjpg=01;35:*.mka=00;36:*.mkv=01;35:*.mng=01;35:*.mov=01;35:*.mp3=00;36:*.mp4=01;35:*.mp4v=01;35:*.mpc=00;36:*.mpeg=01;35:*.mpg=01;35:*.nuv=01;35:*.oga=00;36:*.ogg=00;36:*.ogm=01;35:*.ogv=01;35:*.ogx=01;35:*.opus=00;36:*.pbm=01;35:*.pcx=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.qt=01;35:*.ra=00;36:*.rar=01;31:*.rm=01;35:*.rmvb=01;35:*.rpm=01;31:*.rz=01;31:*.sar=01;31:*.spx=00;36:*.svg=01;35:*.svgz=01;35:*.swm=01;31:*.t7z=01;31:*.tar=01;31:*.taz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tga=01;35:*.tgz=01;31:*.tif=01;35:*.tiff=01;35:*.tlz=01;31:*.txz=01;31:*.tz=01;31:*.tzo=01;31:*.tzst=01;31:*.vob=01;35:*.war=01;31:*.wav=00;36:*.webm=01;35:*.wim=01;31:*.wmv=01;35:*.xbm=01;35:*.xcf=01;35:*.xpm=01;35:*.xspf=00;36:*.xwd=01;35:*.xz=01;31:*.yuv=01;35:*.z=01;31:*.zip=01;31:*.zoo=01;31:*.zst=01;31:bd=40;33;01:ca=30;41:cd=40;33;01:di=01;34:do=01;35:ex=01;32:pi=40;33:ln=01;36:mi=00:mh=00:or=40;31;01:ow=34;42:rs=0:sg=30;43:su=37;41:so=01;35:st=37;44:tw=30;42:";
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
