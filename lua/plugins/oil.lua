local wk = require("which-key")

return {
	{
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		---@module "oil"
		---@type oil.SetupOpts
		opts = {},
		lazy = false,
		init = function()
			wk.add({
				{ "<leader>e", group = "Filesystem" },
				{
					"<leader>eo",
					function()
						require("oil").open_float()
					end,
					desc = "Open Oil",
				},
			})
		end,
	},
}
