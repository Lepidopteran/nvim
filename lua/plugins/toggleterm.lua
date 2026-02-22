return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-\>]],
			direction = "float",
			float_opts = {
				border = "rounded",
				winblend = 3,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})
	end,
}
