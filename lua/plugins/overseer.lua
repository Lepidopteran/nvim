return {
	{
		"stevearc/overseer.nvim",
		keys = {
			{
				"<leader>oo",
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
