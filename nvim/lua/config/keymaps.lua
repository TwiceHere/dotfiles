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

--comment
vim.keymap.set({'n','v'},"<leader>c","gcc",{ remap = true,desc = "Toggle line comment" })
vim.keymap.set('x',"<leader>y",'"+y', { remap = true, desc = "yank to  system clipboard"})
vim.keymap.set('n',"<leader>p",'"+p', { desc = "paste from system clipboard"})
vim.keymap.set('n',"<Esc>","<cmd>noh<CR><Esc>", { desc = "clear search highlights"})
-- Normal & Visual Mode: Code Actions mapped globally so which-key registers it instantly
vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set('n',"%","ggVge", { remap = true, desc = "select entire file"})
vim.keymap.set('n',"mm","%", { desc = "match closest pair"} )
