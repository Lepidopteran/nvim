return {
	"romus204/tree-sitter-manager.nvim",
	lazy = false,
	dependencies = {},
	config = function()
		local config = require("configs.treesitter")
		require("tree-sitter-manager").setup({
			ensure_installed = config.languages,
		})
	end,
}
