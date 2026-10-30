vim.o.number = true         -- Show line numbers
vim.o.relativenumber = true -- Relative line numbers for fast jumping
vim.o.shiftwidth = 4        -- Standard 4-space tab layout
vim.o.tabstop = 4
vim.o.expandtab = true      -- Convert typed tabs into spaces
vim.g.mapleader = " "
vim.o.signcolumn = "auto"   -- yes
vim.o.winborder = "rounded"
vim.o.wrap = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.cursorline = true
vim.cmd.colorscheme("vague") -- catppuccin,vague,


vim.diagnostic.config({
    underline = true,
    virtual_text = true,
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
})
