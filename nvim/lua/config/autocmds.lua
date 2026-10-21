-- 1. Apply your color theme
vim.cmd.colorscheme("catppuccin")

-- 2. Modern Native Format on Save (NixOS-safe fallback)
-- This automatically runs formatting using whichever native LSP is currently active in the buffer
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
