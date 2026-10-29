return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    built = ":TSUpdate",
    opts = {
        compilers = { "cc", "gcc", "clang" },
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
        auto_install = true,
        highlight = {
            enable = true,
        },
    },
}
