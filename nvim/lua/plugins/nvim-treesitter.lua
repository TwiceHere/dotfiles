return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, 
    build = ':TSUpdate', 
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "java"
      },
      highlight = {
          enable = true, 
      }, 
    },
  }
