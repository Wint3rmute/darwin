# macOS configuration
{
  config,
  lib,
  pkgs,
  ...
}: {
  system.defaults = {
    # Dock settings
    dock = {
      autohide = true;
      mru-spaces = false;
      minimize-to-application = true;
      show-recents = true;
    };

    # Finder settings
    finder = {
      AppleShowAllExtensions = true;
      FXEnableExtensionChangeWarning = false;
      QuitMenuItem = true;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    # Trackpad
    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };
  };
}
