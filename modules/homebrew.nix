# Global apps
{
  config,
  lib,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };
    # brews = [
    #   "mas" # Mac App Store CLI
    # ];
    casks = [
      "ghostty"
      "firefox"
      "orion"
      "spotify"
      "gimp"
      "discord"
      "obsidian"
      "slack"
      "audacity"
      "visual-studio-code"
      "signal"
    ];
    # masApps = {
    #   "Amphetamine" = 937984704;
    # };
  };
}
