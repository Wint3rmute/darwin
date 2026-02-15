{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    awscli2
    ansible
    btop
    deno
    duf
    entr
    fastfetch
    ffmpeg
    fzf
    go
    graphviz
    lilypond-unstable
    jdk
    # mpv
    ncdu
    neovim
    nmap
    nodejs
    # poetry
    rustup
    tinymist
    tmux
    typescript-language-server
    typst
    uv
    yt-dlp
    zola
    zoxide
  ];
}
