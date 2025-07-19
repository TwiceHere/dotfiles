return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              venvPath = ".",
              venv = ".venv",
              pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
            },
          },
        },
      },
    },
  },
}
