return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		init = function()
			require("nvim-treesitter").install(require("configs.treesitter"))
		end,
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
			indent = {
				enable = true,
			},
		},
		build = ":TSUpdate",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		opts = {},
	},
}
