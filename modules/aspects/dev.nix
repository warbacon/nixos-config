{
  den.aspects.dev = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          gcc
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
        home.packages = with pkgs; [
          pnpm
          lazygit
        ];

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
        xdg.configFile."lazygit/config.yml".text = # yaml
          ''
            disableStartupPopups: true
            os:
              editPreset: "nvim"
            gui:
              nerdFontsVersion: "3"
              showBottomLine: false
              showRandomTip: false
              spinner:
                rate: 80
                frames:
                - "⠋"
                - "⠙"
                - "⠹"
                - "⠸"
                - "⠼"
                - "⠴"
                - "⠦"
                - "⠧"
                - "⠇"
                - "⠏"
              theme:
                activeBorderColor:
                 - "#52abcf"
                 - "bold"
                inactiveBorderColor:
                 - "#8e8aac"
                selectedLineBgColor:
                 - "#2b3b51"
                defaultFgColor:
                 - "#cdcbdd"
          '';

        programs.npm = {
          enable = true;
          settings = {
            prefix = "\${HOME}/.local/share/npm";
          };
        };
      };
  };
}
