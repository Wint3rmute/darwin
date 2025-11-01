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
    # Typescript, Deno, Helix
    # https://docs.deno.com/runtime/getting_started/setup_your_environment/#helix
    languages = {
      language = [
        {
          name = "typescript";
          auto-format = true;
          roots = ["deno.json" "deno.jsonc" "package.json"];
          file-types = ["ts" "tsx"];
          language-servers = ["deno-lsp"];
        }
      ];
      language-server.deno-lsp = {
        command = "deno";
        args = ["lsp"];
        config.deno.enable = true;
      };
    };
  };
}
