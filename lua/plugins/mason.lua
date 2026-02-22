return {
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = require("configs.mason_lsp"),
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mason-org/mason.nvim",
		lazy = false,
		opts = {},
	},
}
