return {
    "nvim-lualine/lualine.nvim",
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            icons_enabled = true,
            globalstatus = true,
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "%l/%L" },
        },
    },
}
