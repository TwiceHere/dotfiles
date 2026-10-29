return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        -- This covers fallback defaults & standalone commands (like flash.jump())
        search = {
            mode = "fuzzy",
        },
    },
}
