# Global apps
{
  config,
  lib,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # pkgs.darwin.xcode
    # ghostty # TODO: check if available on aarch64
    # firefox # TODO: build errors!?
    nushell
    openconnect
    rectangle
    uutils-coreutils-noprefix
    wireguard-tools
  ];

  networking.extraHostsLines = [
    "# Block Spotify updates"
    "127.0.0.1 upgrade.spotify.com"
    "127.0.0.1 upgrade.scdn.co"
  ];
}
