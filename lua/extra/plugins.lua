local mapping = require("extra.mapping")
local wk = require("which-key")

local plugins = {

	-- UI
	{
		"folke/twilight.nvim",
		cmd = "Twilight",
	},
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					width = 0.85,
				},
			})
		end,

		cmd = "ZenMode",
	},
	{
		"folke/which-key.nvim",
		config = function()
			wk.add(mapping.ZenMode)
			wk.add(mapping.CodeCompanion)
		end,
	},

	-- Markdown

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && bun install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- AI Stuff

	{
		"olimorris/codecompanion.nvim",
		version = "^18.0.0",
		opts = {
			interactions = {
				chat = { adapter = { name = "ollama", model = "qwen2.5-coder:14b" } },
				inline = { adapter = { name = "ollama", model = "qwen2.5-coder:7b" } },
				background = { adapter = { name = "ollama", model = "deepseek-coder:1.3b" } },
			},
		},
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

	-- Colors

	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufEnter",
		config = function()
			require("nvim-highlight-colors").setup({
				enable_tailwind = true,
			})
		end,
	},

	-- Blender Addon Development

	{
		"b0o/blender.nvim",
		config = function()
			require("blender").setup({
				profiles = {
					{
						name = "default",
						cmd = { "blender-addon-dev" },
						enable_dap = false,
					},
				},
				dap = {
					enabled = false,
				},
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"grapp-dev/nui-components.nvim",
			"mfussenegger/nvim-dap", -- Optional, for debugging with DAP
			"LiadOz/nvim-dap-repl-highlights", -- Optional, for syntax highlighting in the DAP REPL
		},
	},

	-- Java Development

	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
	},

	-- Neovim Plugin Development

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"plenary",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{ -- optional blink completion source for require statements and module annotations
		"saghen/blink.cmp",
		opts = {
			sources = {
				-- add lazydev to your completion providers
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}

return plugins
