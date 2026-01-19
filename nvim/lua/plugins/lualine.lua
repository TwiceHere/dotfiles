return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = { ... }, -- your existing options
    sections = {
      lualine_a = { "mode" },
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        function()
          local line = vim.fn.line(".")
          local total = vim.fn.line("$")
          return line .. "/" .. total -- example: 7/25
          -- or: return "Ln " .. line .. "/" .. total
          -- or: return vim.fn.printf("%d:%d", line, vim.fn.col("."))
        end,
      },
    },
    -- inactive_sections as before
  },
}
