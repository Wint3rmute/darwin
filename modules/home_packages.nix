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
    typescript-language-server
    rust-analyzer
    fastfetch
    entr
    nodejs
    zoxide
    poetry
  ];
}
