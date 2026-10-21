vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
vim.lsp.config("jdtls", {
  -- Execute the working shell profile script wrapper directly
  cmd = { "jdtls" },
  
  -- Prevent it from locking up your global ~/dotfiles directory
  root_dir = function(fname)
    local util = require('lspconfig.util')
    local root = util.root_pattern('pom.xml', 'build.gradle', 'gradlew', 'mvnw')(fname)
    
    if not root then
      root = util.root_pattern('.git')(fname)
      if root and (root == os.getenv("HOME") or root:find("dotfiles")) then
        return nil 
      end
    end
    return root
  end,
})

vim.lsp.enable({"lua_ls","pyrefly","jdtls"})
