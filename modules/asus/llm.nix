{ pkgs, ... }: {
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      host = "0.0.0.0";
      openFirewall = true;
    };
    llama-cpp = {
      enable = true;
      package = pkgs.llama-cpp-rocm;
      settings = {
        # batch-size = 2048;
        # ubatch-size = 512;
        ctx-size = 32768;
        flash-attn = "on";
        host = "0.0.0.0";
      };
    };
  };
}
