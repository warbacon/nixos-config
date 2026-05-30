{ inputs, pkgs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    ./kitty
    ./niri.nix
  ];

  services.xserver.xkb.layout = "es";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.graphics.enable32Bit = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.helium.packages."${system}".default
    inputs.zen-browser.packages."${system}".default
    mpv
    steam-run
  ];
  programs.localsend.enable = true;

  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      lilex
      adwaita-fonts
      dejavu_fonts
      liberation_ttf
      nerd-fonts.symbols-only
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];

    fontconfig = {
      enable = true;
      defaultFonts = {
        monospace = [
          "Lilex"
          "Symbols Nerd Font"
        ];
        sansSerif = [ "Adwaita Sans" ];
        serif = [ "Liberation Serif" ];
      };
      localConf = # xml
        ''
          <?xml version="1.0"?>
          <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
          <fontconfig>
            <alias>
                <family>Segoe UI</family>
                <prefer>
                    <family>Adwaita Sans</family>
                </prefer>
            </alias>
            <alias>
                <family>Arial</family>
                <prefer>
                    <family>Liberation Sans</family>
                </prefer>
            </alias>
            <alias>
                <family>Verdana</family>
                <prefer>
                    <family>DejaVu Sans</family>
                </prefer>
            </alias>
          </fontconfig>
        '';
    };
  };

  home-manager.users.warbacon = {
    home.pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      size = 24;
      name = "Bibata-Modern-Ice";
    };

    gtk = {
      enable = true;
      colorScheme = "dark";
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
      };
      gtk2.enable = false;
    };

    xdg = {
      enable = true;
      terminal-exec.enable = true;
      userDirs = {
        enable = true;
        setSessionVariables = false;
        createDirectories = true;
        desktop = "$HOME/";
        documents = "$HOME/Documentos";
        download = "$HOME/Descargas";
        music = "$HOME/";
        pictures = "$HOME/Imágenes";
        projects = "$HOME/Proyectos";
        publicShare = "$HOME/";
        templates = "$HOME/";
        videos = "$HOME/Vídeos";
      };
    };
  };
}
