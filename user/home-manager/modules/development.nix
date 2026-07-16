{pkgs, ...}: {
  home.packages = with pkgs; [
    #nix
    nixd
    alejandra
    statix

    #python
    basedpyright
    ty
    ruff

    #go
    go
    gopls
    golangci-lint
    gotools

    #lua
    lua-language-server

    #bash
    bash-language-server
    shellcheck
    shfmt

    hx-lsp
    #just
    just
    just-lsp
    just-formatter
  ];
}
