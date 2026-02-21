local wk = require("which-key")
return {
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {},
		config = function()
			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>gD", "<cmd>lua require('gitsigns').diffthis()<CR>", desc = "Diff" },
				{ "<leader>gR", group = "Reset" },
				{ "<leader>gRb", "<cmd>lua require('gitsigns').reset_buffer()<CR>", desc = "Reset Buffer" },
				{ "<leader>gRh", "<cmd>lua require('gitsigns').reset_hunk()<CR>", desc = "Reset Hunk" },
				{ "<leader>gS", group = "Stage" },
				{ "<leader>gSb", "<cmd>lua require('gitsigns').stage_buffer()<CR>", desc = "Stage Buffer" },
				{ "<leader>gSh", "<cmd>lua require('gitsigns').stage_hunk()<CR>", desc = "Stage Hunk" },
				{ "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<CR>", desc = "Toggle Blame" },
				{ "<leader>gd", "<cmd>lua require('gitsigns').toggle_deleted()<CR>", desc = "Diff" },
				{ "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", desc = "Preview Hunk" },
			})
		end,
	},
}
