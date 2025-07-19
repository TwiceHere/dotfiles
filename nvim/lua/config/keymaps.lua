-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Move current line down (Ctrl + j)
vim.api.nvim_set_keymap("n", "<C-j>", ":m .+1<CR>", { noremap = true, silent = true })

-- Move current line up (Ctrl + k)
vim.api.nvim_set_keymap("n", "<C-k>", ":m .-2<CR>", { noremap = true, silent = true })

-- Move selected lines down (Ctrl + j in Visual mode)
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<CR>gv", { noremap = true, silent = true })

-- Move selected lines up (Ctrl + k in Visual mode)
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<CR>gv", { noremap = true, silent = true })

-- Resize terminal and window splits using Ctrl + Arrow keys
-- Increase window height (Ctrl + Up)
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })

-- Decrease window height (Ctrl + Down)
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })

-- Decrease window width (Ctrl + Left)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })

-- Increase window width (Ctrl + Right)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })

-- Seamless pane navigation in Normal & Insert mode using Ctrl + Alt + h/j/k/l
local opts = { noremap = true, silent = true }

-- Move to the left pane
vim.keymap.set({ "n", "i" }, "<C-M-h>", "<C-\\><C-n><C-w>h", opts)

-- Move to the down pane
vim.keymap.set({ "n", "i" }, "<C-M-j>", "<C-\\><C-n><C-w>j", opts)

-- Move to the up pane
vim.keymap.set({ "n", "i" }, "<C-M-k>", "<C-\\><C-n><C-w>k", opts)

-- Move to the right pane
vim.keymap.set({ "n", "i" }, "<C-M-l>", "<C-\\><C-n><C-w>l", opts)
