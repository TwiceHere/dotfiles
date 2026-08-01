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

    #rust
    rustc
    cargo
    rust-analyzer
    clippy
    rustfmt

    # helix
    hx-lsp
    simple-completion-language-server

    #just
    just
    just-lsp
    just-formatter

    #spell/grammar checker
    harper

    #android
    # android-tools
  ];
}
