{pkgs, ...}: {
  home.packages = with pkgs; [
    #nix
    nixd
    alejandra
    statix

    #python
    pyright
    ruff

    #go
    gopls
    lua-language-server
  ];
}
