-- vim.pack.add({
--     { src = 'https://github.com/vague-theme/vague.nvim' },
--     { src = "https://github.com/folke/which-key.nvim" },
--     { src = "https://github.com/nvim-mini/mini.ai" },
--     { src = "https://github.com/nvim-mini/mini.pick" },
--     { src = "https://github.com/nvim-mini/mini.pairs" },
--     { src = "https://github.com/nvim-mini/mini.surround" },
--     { src = "https://github.com/rafamadriz/friendly-snippets" },
--     { src = "https://github.com/Saghen/blink.cmp" },
--     { src = "https://github.com/neovim/nvim-lspconfig" },
--     { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim'},
-- })
return {
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        -- you can set set configuration options here
        -- config = function()
        --     vim.g.zenbones_darken_comments = 45
        --     vim.cmd.colorscheme('zenbones')
        -- end
    },
    {
        "vague-theme/vague.nvim",
        opts = {},
    },
    {
        'stevearc/conform.nvim',
        opts = {},
    },
    {
        "nvim-mini/mini.ai",
        event = "VeryLazy",
        opts = {}
    },
    -- { "nvim-mini/mini.pick", opts = {} },
    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {}
    },
    {
        "nvim-mini/mini.surround",
        event = "VeryLazy",
        opts = {}
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
        },
    },
    -- {"neovim/nvim-lspconfig",opts = {}},
}
