{
  pkgs,
  lib,
  config,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    substituters = [
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  time.timeZone = "Europe/Madrid";
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";

  users.users.warbacon = {
    isNormalUser = true;
    description = "Joaquín Guerra";
    extraGroups = [ "wheel" ];
  };

  environment.shellAliases = lib.mkForce {
    cp = "cp -vi";
    mv = "mv -vi";
    rm = "rm -v";
    ls = "ls --color -vp";
    ll = "ls --color -lvhp";
    la = "ls --color -lvAhp";
    tree = "tree --gitignore -aC";
    grep = "grep --color";
    open = "xdg-open";
    ff = "fastfetch";
    lg = "lazygit";
  };

  environment.sessionVariables = {
    MANPAGER = "nvim +Man!";
    FZF_DEFAULT_OPTIONS = "--layout=reverse";
    FZF_CTRL_T_COMMAND = "fd -H --color=never";
    FZF_ALT_C_COMMAND = "fd -H --color=never --type d";
    FZF_DEFAULT_OPTS = ''
      --highlight-line \
      --color=fg:#cdcbdd \
      --color=bg:#181624 \
      --color=gutter:#181624 \
      --color=border:#52abcf \
      --color=separator:#52abcf \
      --color=scrollbar:#625f7e \
      --color=hl:#e97294 \
      --color=hl+:#e97294 \
      --color=fg+:#cdcbdd \
      --color=bg+:#2b3b51 \
      --color=pointer:#e9b5b3 \
      --color=prompt:#e9b5b3 \
      --color=spinner:#e9b5b3 \
      --color=marker:#e9b5b3 \
      --color=header:#52abcf \
      --color=info:#8e8aac \
      --color=preview-border:#52abcf \
      --color=preview-scrollbar:#625f7e
    '';
  };

  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    defaultEditor = true;
  };

  programs.nix-index-database.comma.enable = true;
  programs.nix-index = {
    enableBashIntegration = false;
    enableZshIntegration = false;
    enableFishIntegration = false;
  };

  programs.fish = {
    enable = true;
    useBabelfish = true;
    shellAliases = lib.mkForce { };
    shellAbbrs = config.environment.shellAliases;
  };

  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
  };

  programs.bash = {
    interactiveShellInit = ''
      bind "set completion-ignore-case on"
      bind "set show-all-if-ambiguous on"
      shopt -s autocd
      shopt -s cdspell
      shopt -s histappend
      export HISTCONTROL=ignoreboth:erasedups

      source <(starship init bash --print-full-init)
      source <(fzf --bash)
    '';
  };

  environment.systemPackages = with pkgs; [
    _7zip-zstd-rar
    gcc
    git
    killall
    tree
    unrar
    unzip
    wget
    xdg-utils
    zip

    dix
    nix-output-monitor

    opencode
    pi-coding-agent

    btop-rocm
    fastfetch
    fd
    fzf
    gh
    jq
    lazygit
    numbat
    ripgrep
    starship
    steam-run
    tlrc
    trash-cli
  ];

  system.stateVersion = "25.11";
}
