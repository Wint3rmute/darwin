{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    settings.user = {
      email = "mateusz.baczek1998@gmail.com";
      name = "wint3rmute";
    };
    settings = {
      push.autoSetupRemote = true;
    };
    lfs.enable = true;
  };

  # Syntax highlighting for `git diff`
  programs.delta.enable = true;
}
