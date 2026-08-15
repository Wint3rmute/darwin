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
        # ubatch-size = 512;
        ctx-size = 32768;
        flash-attn = "on";
        host = "0.0.0.0";
        # "unsloth/Qwen3.8-27B-GGUF" = {
        #   temp = 1.0;
        #   top-k = 20;
        #   top-p = 0.95;
        #   min-p = 0.0;
        #   presence-penalty = 0.0;
        #   repetition-penalty=1.0;
        # };
      };
    };
  };
}
