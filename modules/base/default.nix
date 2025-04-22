{ inputs, config, ... }:
let
  homeDir = config.home-manager.users.warbacon.home.homeDirectory;
  stateVersion = "24.11";
in
{
  imports = [
    ./programs
    ./compat.nix
    ./shell.nix
    ./users.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Home manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.warbacon = {
      home.username = "warbacon";
      home.homeDirectory = "/home/warbacon";
      home.stateVersion = stateVersion;
      programs.home-manager.enable = true;

      # XDG
      xdg = {
        userDirs = {
          enable = true;
          createDirectories = true;
          desktop = null;
          music = null;
          templates = null;
          publicShare = null;
          documents = "${homeDir}/Documentos";
          download = "${homeDir}/Descargas";
          pictures = "${homeDir}/Imágenes";
          videos = "${homeDir}/Vídeos";
        };
      };
    };
  };

  # Documentation
  documentation.nixos.enable = false;
  documentation.man.generateCaches = false;

  # NIX_PATH
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  # Experimental features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Timezone
  time.timeZone = "Europe/Madrid";

  # Locale
  i18n.defaultLocale = "es_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_ES.UTF-8";
    LC_IDENTIFICATION = "es_ES.UTF-8";
    LC_MEASUREMENT = "es_ES.UTF-8";
    LC_MONETARY = "es_ES.UTF-8";
    LC_NAME = "es_ES.UTF-8";
    LC_NUMERIC = "es_ES.UTF-8";
    LC_PAPER = "es_ES.UTF-8";
    LC_TELEPHONE = "es_ES.UTF-8";
    LC_TIME = "es_ES.UTF-8";
  };

  # Configure console keymap
  console.keyMap = "es";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  system.stateVersion = stateVersion;
}
