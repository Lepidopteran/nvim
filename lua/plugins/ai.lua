local wk = require("which-key")

return {
	{
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		event = "VeryLazy",
		opts = {
			interactions = {
				chat = { adapter = { name = "ollama", model = "qwen2.5-coder:14b" } },
				inline = { adapter = { name = "ollama", model = "qwen2.5-coder:7b" } },
				background = { adapter = { name = "ollama", model = "deepseek-coder:1.3b" } },
			},
		},
		init = function()
			local code = require("codecompanion")

			wk.add({
				{ "<leader>a", group = "Artificial Intelligence", icon = "🧠" },
				{
					"<leader>aa",
					function()
						code.actions({})
					end,
					desc = "Actions",
				},
				{
					"<leader>ac",
					function()
						code.toggle()
					end,
					desc = "Toggle Code Companion Chat",
				},
				{
					"<leader>ap",
					function()
						code.inline({})
					end,
					desc = "Code Companion Inline",
				}
			})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
			{
				"HakonHarnes/img-clip.nvim",
				opts = {
					filetypes = {
						codecompanion = {
							prompt_for_file_name = false,
							template = "[Image]($FILE_PATH)",
							use_absolute_path = true,
						},
					},
				},
			},
			{ "saghen/blink.cmp", opts = { sources = { per_filetype = { codecompanion = { "codecompanion" } } } } },
		},
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		config = function()
			vim.g.codeium_disable_bindings = 1
			vim.keymap.set("i", "<M-l>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<M-Bslash>", function()
				return vim.fn["codeium#Complete"]()
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<M-k>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<M-j>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, { expr = true, silent = true })
			vim.keymap.set("i", "<M-/>", function()
				return vim.fn["codeium#Clear"]()
			end, { expr = true, silent = true })
		end,
	},
}
