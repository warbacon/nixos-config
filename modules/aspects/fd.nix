{
  den.aspects.fd = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = [
          pkgs.fd
        ];
      };

    homeManager =
      { lib, ... }:
      {
        xdg.configFile."fd/ignore".text = lib.concatLines [
          ".cache"
          ".bun"
          ".npm"
        ];
      };
  };
}
