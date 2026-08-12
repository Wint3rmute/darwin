{ pkgs, ... }: {
  services = {
    ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
    };
    llama-cpp = {
      enable = true;
      package = pkgs.llama-cpp-rocm;
    };
  };
}
