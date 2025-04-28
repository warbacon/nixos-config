{ pkgs, ... }:
let
  zathura = (pkgs.zathura.override { useMupdf = true; });
in
{
  environment.systemPackages = [ zathura ];

  home-manager.users.warbacon.programs.zathura = {
    enable = true;
    options = {
      font = "monospace 13";
      statusbar-home-tilde = true;
      window-title-basename = true;
      recolor-keephue = true;
      selection-clipboard = "clipboard";

      # Tokyonight
      notification-error-bg = "#f7768e";
      notification-error-fg = "#c0caf5";
      notification-warning-bg = "#e0af68";
      notification-warning-fg = "#414868";
      notification-bg = "#1a1b26";
      notification-fg = "#c0caf5";
      completion-bg = "#1a1b26";
      completion-fg = "#a9b1d6";
      completion-group-bg = "#1a1b26";
      completion-group-fg = "#a9b1d6";
      completion-highlight-bg = "#414868";
      completion-highlight-fg = "#c0caf5";
      index-bg = "#1a1b26";
      index-fg = "#c0caf5";
      index-active-bg = "#414868";
      index-active-fg = "#c0caf5";
      inputbar-bg = "#1a1b26";
      inputbar-fg = "#c0caf5";
      statusbar-bg = "#1a1b26";
      statusbar-fg = "#c0caf5";
      highlight-color = "rgba(224, 175, 104, 0.5)";
      highlight-transparency = 0.15;
      highlight-active-color = "#9ece6a";
      default-bg = "#1a1b26";
      default-fg = "#c0caf5";
      render-loading = true;
      render-loading-fg = "#1a1b26";
      render-loading-bg = "#c0caf5";

      recolor-lightcolor = "#1a1b26";
      recolor-darkcolor = "#c0caf5";
    };
  };
}
