return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		opts = require("configs.treesitter"),
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		opts = {},
	},
}
