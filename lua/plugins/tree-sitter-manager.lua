local treesitter = require("configs.treesitter")

return {
	{
		"romus204/tree-sitter-manager.nvim",
		lazy = false,
		opts = {
			ensure_installed = treesitter.languages,
			highlight = true,
		},
	},
}
