{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    ansible
    cargo
    deno
    entr
    fastfetch
    graphviz
    mpv
    neovim
    nodejs
    poetry
    rust-analyzer
    typescript-language-server
    typst
    zola
    zoxide
    tinymist
    rustfmt
  ];
}
