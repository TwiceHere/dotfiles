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
        'stevearc/conform.nvim',
        opts = {},
    },
    {
        "nvim-mini/mini.ai",
        event = "VeryLazy",
        opts = {}
    },
    { "nvim-mini/mini.pick", opts = {} },
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
    { "folke/flash.nvim",    opts = {} },
    {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '*',
        -- AND/OR build from source
        build = 'cargo build --release',
        -- If you use nix, you can build from source with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = 'super-tab' },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'mono'
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    }
    ,
    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = function()
            local logo = [[
     ██████╗       ██╗     ██╗███╗   ██╗███████╗██████╗
    ██╔════╝       ██║     ██║████╗  ██║██╔════╝██╔══██╗
    ██║  ███╗█████╗██║     ██║██╔██╗ ██║█████╗  ██████╔╝
    ██║   ██║╚════╝██║     ██║██║╚██╗██║██╔══╝  ██╔══██╗
    ╚██████╔╝      ███████╗██║██║ ╚████║███████╗██║  ██║
     ╚═════╝       ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
    ]]

            logo = string.rep("\n", 8) .. logo .. "\n\n"

            local opts = {
                theme = "doom",
                hide = {
                    -- this is taken care of by lualine
                    -- enabling this messes up the actual laststatus setting after loading a file
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, "\n"),
                    -- stylua: ignore
                    center = {
                        { action = function() require("mini.pick").builtin.files() end, desc = " Find File", icon = " ", key = "f" },
                        { action = "ene | startinsert", desc = " New File", icon = " ", key = "n" },
                        { action = function() require("mini.pick").builtin.visit() end, desc = " Recent Files", icon = " ", key = "r" },
                        { action = 'lua LazyVim.pick("live_grep")()', desc = " Find Text", icon = " ", key = "g" },
                        { action = 'lua LazyVim.pick.config_files()()', desc = " Config", icon = " ", key = "c" },
                        { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
                        { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
                        { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                        { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit", icon = " ", key = "q" },
                    },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
                    end,
                },
            }

            for _, button in ipairs(opts.config.center) do
                button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
                button.key_format = "  %s"
            end

            -- open dashboard after closing lazy
            if vim.o.filetype == "lazy" then
                vim.api.nvim_create_autocmd("WinClosed", {
                    pattern = tostring(vim.api.nvim_get_current_win()),
                    once = true,
                    callback = function()
                        vim.schedule(function()
                            vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
                        end)
                    end,
                })
            end

            return opts
        end,
    },
}
