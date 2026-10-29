{pkgs, ...}: {
  home.packages = with pkgs; [
    # gnome-pomodoro
    cava
    wl-clipboard
    blanket
    cbonsai
    # mdcat
    pipx
    # leaf-markdown-viewer
    watchexec
    vimPlugins.nvim-treesitter-parsers.python
    vimPlugins.nvim-treesitter-parsers.lua
    vimPlugins.nvim-treesitter-parsers.bash
    vimPlugins.nvim-treesitter-parsers.markdown   
    tree-sitter
  ];
}
