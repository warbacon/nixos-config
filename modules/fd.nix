{ pkgs, lib, ... }:
{
  environment.sessionVariables = {
    FZF_CTRL_T_COMMAND = "fd -H --color=never";
    FZF_ALT_C_COMMAND = "fd -H --color=never --type d";
  };

  environment.systemPackages = [
    pkgs.fd
  ];

  home-manager.users.warbacon.xdg.configFile."fd/ignore".text = lib.concatLines [
    ".ServiceHub"
    ".android"
    ".bun"
    ".cache"
    ".cargo"
    ".copilot"
    ".dotnet"
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
    ".ssh"
    ".vscode"
    "Android"
    "go"
    "node_modules"
    "vendor"
  ];
}
