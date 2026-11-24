local wk = require("which-key")

return {
	{
		"stevearc/oil.nvim",
		dependencies = {
			"echasnovski/mini.icons",
			{
				"JezerM/oil-lsp-diagnostics.nvim",
				event = "BufReadPre",
				dependencies = { "stevearc/oil.nvim" },
				opts = {},
			},
			{
				"malewicz1337/oil-git.nvim",
				dependencies = { "stevearc/oil.nvim" },
			},
		},
		---@module "oil"
		---@type oil.SetupOpts
		opts = {
			delete_to_trash = true,
			watch_for_changes = true,
			skip_confirm_for_simple_edits = true,
			lsp_file_methods = {
				autosave_changes = "unmodified",
			},
			float = {
				padding = 4,
				border = "rounded",
			},
		},
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
