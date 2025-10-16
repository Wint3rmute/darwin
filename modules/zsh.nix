{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  programs.fzf.enableZshIntegration = true;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      eval "$(zoxide init zsh --cmd cd)"
    '';
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "sudo"];
      theme = "robbyrussell";
    };
  };
}
