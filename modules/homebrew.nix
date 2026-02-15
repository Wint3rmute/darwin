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
      "ghostty"
      "gimp"
      "keepassxc"
      "nextcloud"
      "obsidian"
      "orion"
      "signal"
      "slack"
      "spotify"
      "tigervnc"
      "visual-studio-code"
      "vlc"
      "yacreader"
    ];
    # masApps = {
    #   "Amphetamine" = 937984704;
    # };
  };
}
