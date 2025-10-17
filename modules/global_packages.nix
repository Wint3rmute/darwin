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
    btop
    fzf
    duf
    git
    neovim
    openfortivpn
    openconnect
    nmap
    tmux
    rectangle
    vscode
    signal-desktop-bin
    openvpn3
  ];
}
