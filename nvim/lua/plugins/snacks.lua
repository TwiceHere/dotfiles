return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        picker = {
            enabled = true,
            layout = {
                preset = "select", --ivy
            },
        },
        indent = { enabled = true },
        scroll = { enabled = true },
        -- input = { enabled = true },
        scope = { enabled = true },
        words = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                header = [[
     ██████╗       ██╗     ██╗███╗   ██╗███████╗██████╗
    ██╔════╝       ██║     ██║████╗  ██║██╔════╝██╔══██╗
    ██║  ███╗█████╗██║     ██║██╔██╗ ██║█████╗  ██████╔╝
    ██║   ██║╚════╝██║     ██║██║╚██╗██║██╔══╝  ██╔══██╗
    ╚██████╔╝      ███████╗██║██║ ╚████║███████╗██║  ██║
     ╚═════╝       ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                ]],
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys",   gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },
    keys = {
        {
            "<leader>/",
            function()
                Snacks.picker.grep({
                    layout = {
                        preset = "select", --vertical
                    },
                })
            end,
            desc = "Live Grep"
        },
        {
            "<leader>f",
            function()
                Snacks.picker.files({
                    layout = {
                        preset = "select"
                    }
                })
            end,
            desc = "Find files"
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers({
                    layout = {
                        preset = "vscode",
                        preview = false,
                    },
                })
            end,
            desc = "Pick buffers"
        },
        {
            "<leader>d",
            function()
                Snacks.picker.diagnostics({
                    filter = { buf = 0 },
                    layout = {
                        preset = "select",
                    },
                })
            end,
            desc = "diagnostics"
        },

        -- 🎯 Helix-like LSP Reference Picker (space + s + r)
        { "<leader>h", function() Snacks.picker.lsp_references() end, desc = "Helix LSP References" },

        -- 📂 Additional Helix-like Picker (space + s for File Symbols)
        {
            "<leader>s",
            function()
                Snacks.picker.lsp_symbols({
                    filter = {
                        default = {
                            "Class",
                            "Function",
                            "Method",
                            "Variable",
                            "Module",
                            "Property",
                            "Field",
                        },
                    },
                    layout = {
                        preset = "select"
                    },
                })
            end,
            desc = "Helix lsp Symbols"
        },
    },
}
