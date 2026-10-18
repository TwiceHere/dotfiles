vim.keymap.set('n', '<leader>o', ':update<CR> : source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set("n", "<C-j>", ":m .+1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv", { noremap = true, silent = true })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { noremap = true, silent = true })
local opts = { noremap = true, silent = true }
vim.keymap.set({ "n", "i" }, "<C-M-h>", "<C-\\><C-n><C-w>h", opts)
vim.keymap.set({ "n", "i" }, "<C-M-j>", "<C-\\><C-n><C-w>j", opts)
vim.keymap.set({ "n", "i" }, "<C-M-k>", "<C-\\><C-n><C-w>k", opts)
vim.keymap.set({ "n", "i" }, "<C-M-l>", "<C-\\><C-n><C-w>l", opts)
vim.keymap.set("i", "<C-M-i>", "<Esc>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>f', "<cmd>Pick files<CR>", { desc = "find files" })
vim.keymap.set('n', '<leader>b', "<cmd>Pick buffers<CR>", { desc = "choose buffers" })

local modes = { 'n', 'v', 'o' }
vim.keymap.set(modes, 'gs', '^', { desc = "Go to line start" })
vim.keymap.set(modes, 'gl', 'g_', { desc = "Go to line end" })
vim.keymap.set(modes, 'ge', 'G_', { desc = "Go to end of file" })
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

--vim.keymap.set('n', '<leader>f',function() require("snacks").picker.files() end, { desc = "Pick Files" })
