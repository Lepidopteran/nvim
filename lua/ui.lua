local wk = require("which-key")

return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd("colorscheme kanagawa")
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"folke/noice.nvim",
		lazy = false,
		init = function()
			wk.add({
				{ "<leader>fM", "<cmd>Noice fzf<CR>", desc = "Messages" },
			})
		end,
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
		},
	},
}
