local wk = require("which-key")
return {
	{
		"stevearc/overseer.nvim",
		---@module 'overseer'
		---@type overseer.SetupOpts
		init = function()
			wk.add({
				{ "<leader>r", group = "Overseer" },
			})
		end,
		keys = {
			{
				"<leader>rr",
				function()
					require("overseer").run_task()
				end,
				desc = "Run Task",
			},
			{
				"<leader>ro",
				function()
					require("overseer").toggle()
				end,
				desc = "Open Overseer",
			},
		},
		opts = {
			task_list = {
				direction = "right",
			},
		},
	},
}
