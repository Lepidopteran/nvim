local wk = require("which-key")

return {
	{
		"mfussenegger/nvim-dap",
		event = "BufReadPre",
		config = function()
			require("dap").adapters.cpp = {
				type = "executable",
				command = "lldb-vscode",
			}
		end,
	},
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
	{
		"folke/trouble.nvim",
		command = { "Trouble" },
		opts = {},
		init = function()
			wk.add({ { "<leader>t", group = "Trouble" } })
		end,
		keys =
		{
			{
				"<leader>tt",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>tT",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>tc",
				"<cmd>Trouble todo toggle<cr>",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"<leader>fc",
				"<cmd>TodoFzfLua<CR>",
				desc = "Find Todo",
			},
		}
	},
}
