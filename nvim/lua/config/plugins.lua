vim.pack.add({
  { src= 'https://github.com/vague-theme/vague.nvim' }, 
  { src="https://github.com/folke/snacks.nvim" }, 
  { src= "https://github.com/folke/which-key.nvim" },
  { src= "https://github.com/nvim-mini/mini.pick"}, 
})

local pick = require('mini.pick')
pick.setup()

