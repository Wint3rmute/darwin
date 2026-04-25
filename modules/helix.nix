{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraConfig = builtins.readFile ./helix.toml;
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
