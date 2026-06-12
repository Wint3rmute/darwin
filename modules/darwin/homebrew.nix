# Global apps
_: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
      extraFlags = [
        "--force-cleanup"
      ];
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
      "godot"
      "keepassxc"
      "microsoft-teams"
      "nextcloud"
      "obsidian"
      "orion"
      "rectangle"
      "signal"
      "slack"
      "spotify"
      "telegram"
      "tigervnc"
      "visual-studio-code"
      "vlc"
      "xquartz"
      "yacreader"
      "zed"
    ];
    # masApps = {
    #   "Amphetamine" = 937984704;
    # };
  };
}
