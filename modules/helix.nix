{
  config,
  lib,
  home,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    # https://docs.helix-editor.com/configuration.html
    extraConfig = ''
      theme = "base16_transparent"
      [editor]
      line-number = "relative"

      [keys.normal]
      "0" = "goto_line_start"
      "C-r" = "redo"
      # "g" = ":reflow"
      # ":e" = ":reload"

      "}" = "goto_next_paragraph"
      "{" = "goto_prev_paragraph"

      [keys.normal.space]
      "q" = ":quit"
      "/" = "toggle_comments"
      "s" = "global_search"
    '';
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true;
        }
      ];
    };
  };
}
