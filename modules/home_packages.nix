{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    cargo
    deno
    neovim
    mpv
    gcc
    fastfetch
    entr
    nodejs
    zoxide
  ];
}
