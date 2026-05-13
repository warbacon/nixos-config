{
  den.aspects.dev = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          gcc
          lazygit
          pi-coding-agent

          tree-sitter

          bash-language-server
          clang-tools
          emmet-language-server
          emmylua-ls
          nixd
          svelte-language-server
          tailwindcss-language-server
          typescript-go
          vscode-langservers-extracted
          yaml-language-server

          nixfmt
          prettierd
          shellcheck
          shfmt
          stylua
          taplo
        ];
      };

    homeManager =
      { pkgs, ... }:
      {
        programs.git = {
          enable = true;
          settings = {
            init.defaultBranch = "main";
            user = {
              email = "joaquinguerratocino@gmail.com";
              name = "Joaquín Guerra";
            };
          };
        };
        programs.gh = {
          enable = true;
          extensions = [
            pkgs.gh-markdown-preview
          ];
        };

        programs.npm = {
          enable = true;
          settings = {
            prefix = "\${HOME}/.local/share/npm";
          };
        };
        home.packages = [
          pkgs.pnpm
        ];
      };
  };
}
