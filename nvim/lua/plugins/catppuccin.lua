return {
  "catppuccin/nvim", -- plugin repo
  lazy = false, -- load immediately at startup (not on demand)
  name = "catppuccin", -- give it a name so Lazy can reference it
  opts = {
    flavour = "mocha", -- choose default flavor (latte, frappe, macchiato, mocha)
    integrations = { ... }, -- integrations with other plugins (you listed them earlier)
  },
  config = function(_, opts)
    require("catppuccin").setup(opts) -- apply your opts
    vim.cmd.colorscheme("catppuccin") -- activate theme
  end,
}
