return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    -- lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")
        ts.setup({})

        -- async, no-op for already-installed parsers
        ts.install({
            "bash", "html", "javascript", "json", "lua", "markdown",
            "markdown_inline", "python", "query", "regex", "tsx",
            "typescript", "vim", "yaml", "java",
        })

        -- highlighting + auto-install replacement
        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local lang = vim.treesitter.language.get_lang(args.match)
                if not lang then return end
                if not pcall(vim.treesitter.start, args.buf, lang) then
                    -- parser missing: install, then start once ready
                    if vim.list_contains(ts.get_available(), lang) then
                        ts.install(lang):await(function()
                            if vim.api.nvim_buf_is_valid(args.buf) then
                                pcall(vim.treesitter.start, args.buf, lang)
                            end
                        end)
                    end
                end
            end,
        })
    end,
}
-- return {
--     "nvim-treesitter/nvim-treesitter",
--     lazy = false,
--     build = ":TSUpdate",
--     config = true,
--     opts = {
--         compilers = { "cc", "gcc", "clang" },
--         ensure_installed = {
--             "bash",
--             "html",
--             "javascript",
--             "json",
--             "lua",
--             "markdown",
--             "markdown_inline",
--             "python",
--             "query",
--             "regex",
--             "tsx",
--             "typescript",
--             "vim",
--             "yaml",
--             "java"
--         },
--         auto_install = true,
--         highlight = {
--             enable = true,
--             additional_vim_regex_highlighting = false,
--         },
--     },
-- }
