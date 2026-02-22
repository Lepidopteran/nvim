local wk = require("which-key")
return {
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		image = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		lazygit = {
			theme = {
				[241] = { fg = "Special" },
				activeBorderColor = { fg = "String", bold = true },
				cherryPickedCommitBgColor = { fg = "Identifier" },
				cherryPickedCommitFgColor = { fg = "Function" },
				defaultFgColor = { fg = "Normal" },
				inactiveBorderColor = { fg = "FloatBorder" },
				optionsTextColor = { fg = "Function" },
				searchingActiveBorderColor = { fg = "String", bold = true },
				selectedLineBgColor = { bg = "Visual" },
				unstagedChangesColor = { fg = "DiagnosticError" },
			},
		},
		win = {
			border = "rounded",
			minimal = false,
		},
	},
	init = function()
		local snacks = require("snacks")
		wk.add({
			{
				"<leader>gi",
				function()
					snacks.lazygit.open()
				end,
				desc = "Open LazyGit",
			},
		})
	end,
}
