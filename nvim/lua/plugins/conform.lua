return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            java = { "google-java-format" },
            nix = { "alejandra" },
            python = { "ruff" },
            go = { "goimports" },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
    },
}
