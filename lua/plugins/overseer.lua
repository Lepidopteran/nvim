local wk = require("which-key")
return {
	{
		"stevearc/overseer.nvim",
		init = function ()
			wk.add({
				{ "<leader>o", group = "Overseer" },
			})
		end,
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
