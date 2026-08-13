{ pkgs, ... }: {
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
    };
    llama-cpp = {
      enable = true;
      package = pkgs.llama-cpp-rocm;
      settings = {
        # batch-size = 2048;
        ctx-size = 16384;
        flash-attn = "on";
        host = "0.0.0.0";
        # ubatch-size = 512;
      };
    };
  };
}
