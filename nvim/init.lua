-- ========================================================================== --
--                  NEOVIM v0.12.6 PURE NATIVE ENTRYPOINT                     --
-- ========================================================================== --
-- Set the global leader key to Space (must be defined BEFORE loading keymaps)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
-- require("config.lsp")
