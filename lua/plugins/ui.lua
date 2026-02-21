return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		init = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		opts = {
			stages = "static",
		},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				enabled = true,
				view = "cmdline",
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				long_message_to_split = true,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
