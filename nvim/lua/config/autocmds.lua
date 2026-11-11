-- Standard Neovim Transparency Autocommand
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        local hl_groups = {
            "Normal", -- Main editor workspace background
            "NormalFloat", -- Floating windows (LSP definitions, diagnostics)
            "FloatBorder", -- Borders around floating windows
            "Pmenu",  -- Popup completion menu background
            "PmenuSel", -- Popup completion menu selected item
            "SignColumn", -- Column on the left for git signs/diagnostics
            "LineNr", -- Line numbers
            "CursorLineNr", -- Current line number
            "Folded", -- Folded code blocks
            "NonText", -- Empty space characters at the end of files
        }

        for _, group in ipairs(hl_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
        end
    end,
})
-- 1. Apply your color theme

-- 2. Modern Native Format on Save (NixOS-safe fallback)
-- This automatically runs formatting using whichever native LSP is currently active in the buffer

-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*",
--     callback = function()
--         vim.lsp.buf.format({ async = false })
--     end,
-- })
