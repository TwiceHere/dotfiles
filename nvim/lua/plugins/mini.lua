return {
    -- {
    --     "nvim-mini/mini.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         ai = {
    --             n_lines = 500,
    --         },
    --         surround = {},
    --     },
    --     config = function(_, opts)
    --         for module, settings in pairs(opts) do
    --             require("mini." .. module).setup(settings)
    --         end
    --     end,
    -- },
    {
        "nvim-mini/mini.pairs",
        event = "VeryLazy",
        opts = {
            modes = { insert = true, command = true, terminal = false },
            -- skip autopair when next character is one of these
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            -- skip autopair when the cursor is inside these treesitter nodes
            skip_ts = { "string" },
            -- skip autopair when next character is closing pair
            -- and there are more closing pairs than opening pairs
            skip_unbalanced = true,
            -- better deal with markdown code blocks
            markdown = true,
        },
    },
    {
        "nvim-mini/mini.surround",
        event = "VeryLazy",
        opts = {
            -- mappings = {
            --     add = "ms",
            --     delete = "md",
            --     replace = "mr",
            --     find = '',
            --     find_left = '',
            --     highlight = '',
            --     update_n_lines = '',
            -- },
        },
    },
    {
        "nvim-mini/mini.ai",
        event = "VeryLazy",
        opts = {
            n_lines = 500,
        },
    },
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {},
        init = function()
            -- Intercept packages before they look for nvim-web-devicons
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
}
