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
    rustup
    yt-dlp
    deno
    ffmpeg
    entr
    fastfetch
    graphviz
    mpv
    neovim
    nodejs
    poetry
    typescript-language-server
    typst
    zola
    zoxide
    tinymist
  ];
}
