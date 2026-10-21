return {
  {
    "neovim/nvim-lspconfig",
    -- Load LSP engine as soon as you open a code buffer
    event = { "BufReadPre", "BufNewFile" }, 
    config = function()
      -- 1. Setup Global Keymaps (Fires when any LSP connects to a buffer)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf }
          -- Your standard IDE shortcuts
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)  -- Go to definition
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)        -- Documentation popup
        end,
      })

      -- 2. Configure individual servers using the modern Neovim API
      -- Silences the annoying "Undefined global 'vim'" warning in your config files
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })
      -- 3. Turn on the servers (Must be installed on your NixOS machine via systemPackages!)
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("nil")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("pyrefly")
      vim.lsp.enable("jdtls")
    end,

  }
}
