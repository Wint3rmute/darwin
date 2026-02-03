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
      "audacity"
      "discord"
      "firefox"
      "tigervnc"
      "ghostty"
      "gimp"
      "keepassxc"
      "nextcloud"
      "obsidian"
      "orion"
      "signal"
      "slack"
      "spotify"
      "visual-studio-code"
      "vlc"
    ];
    # masApps = {
    #   "Amphetamine" = 937984704;
    # };
  };
}
