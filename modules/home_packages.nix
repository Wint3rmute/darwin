{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # signal-desktop
    alejandra
    cargo
    deno
    mpv
    gcc
    fastfetch
    entr
    nodejs
    zoxide
  ];
}
