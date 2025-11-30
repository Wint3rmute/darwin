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
    btop
    discord
    duf
    fzf
    git
    nmap
    obsidian
    slack
    openconnect
    audacity
    openscad
    gimp2
    ncdu
    spotify
    uutils-coreutils-noprefix
    wireguard-tools
    openfortivpn
    rectangle
    # signal-desktop-bin # Outdated :(
    tmux
    vscode
  ];

  environment.etc."hosts" = {
    text = ''
      ##
      # Host Database
      #
      # localhost is used to configure the loopback interface
      # when the system is booting.  Do not change this entry.
      ##
      127.0.0.1       localhost
      255.255.255.255 broadcasthost
      ::1             localhost

      # Block Spotify updates
      127.0.0.1 upgrade.spotify.com
      127.0.0.1 upgrade.scdn.co
    '';
  };
}
