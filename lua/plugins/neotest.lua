local wk = require("which-key")
return {
	{
		"nvim-neotest/neotest",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.consumers = {
				overseer = require("neotest.consumers.overseer"),
			}
			opts.adapters = {
				require("rustaceanvim.neotest"),
				require("neotest-vitest"),
			}
		end,
		init = function()
			local neotest = require("neotest")
			wk.add({
				{ "<leader>T", group = "Tests" },
				{
					"<leader>Ts",
					function()
						neotest.summary.toggle()
					end,
					desc = "Neotest Summary",
				},
				{
					"<leader>Tw",
					function()
						neotest.watch.toggle()
					end,
					desc = "Neotest Run",
				},
				{
					"<leader>Tt",
					function()
						neotest.run.run()
					end,
					desc = "Run Nearest",
				},
				{
					"<leader>Tf",
					function()
						neotest.run.run(vim.fn.expand("%"))
					end,
					desc = "Run File",
				},
			})
		end,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
		},
	},
}
