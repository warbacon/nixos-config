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
          ".ServiceHub"
          ".agents"
          ".bun"
          ".cache"
          ".cargo"
          ".copilot"
          ".dotnet"
          ".firefox"
          ".git"
          ".gnupg"
          ".gradle"
          ".java"
          ".javacpp"
          ".m2"
          ".npm"
          ".nuget"
          ".pki"
          ".plastic4"
          ".renpy"
          ".vaadin"
          ".vscode"
          ".zen"
          "go"
          "node_modules"
          "vendor"
        ];
      };
  };
}
