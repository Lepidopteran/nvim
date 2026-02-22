local wk = require("which-key")

return {
	{
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
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
			}
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
