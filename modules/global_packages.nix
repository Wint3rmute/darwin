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
    duf
    fzf
    git
    nmap
    obsidian
    slack
    openconnect
    openfortivpn
    rectangle
    # signal-desktop-bin # Outdated :(
    tmux
    vscode
  ];
}
