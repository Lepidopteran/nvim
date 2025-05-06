local mapping = require("extra.mapping")
local wk = require("which-key")

local plugins = {
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
	{
		"jackMort/ChatGPT.nvim",
	-- Screenshots

	{
		"mistricky/codesnap.nvim",
		build = "make",
	},

	-- AI Stuff

	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
		opts = {
			provider = "openai",
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
				api_key_name = "cmd:bw get notes chatgpt.nvim --raw",
				timeout = 30000, -- timeout in milliseconds
				temperature = 0, -- adjust if needed
				max_tokens = 4096,
			},
			vendors = {
				mistral = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = "http://127.0.0.1:11434/v1",
					model = "mistral",
				},
				["llama3.1"] = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = "http://127.0.0.1:11434/v1",
					model = "llama3.1",
				},
			},
		},
		build = "make",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
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
	{
		"brenoprata10/nvim-highlight-colors",
		event = "BufEnter",
		config = function()
			require("nvim-highlight-colors").setup({
				enable_tailwind = true,
			})
		end,
	},

	-- SQL Development

	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				default = { "dadbod" },
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				},
			},
		},
	},

	-- Blender Addon Development

	{
		"b0o/blender.nvim",
		config = function()
			require("blender").setup({
				profiles = {
					{
						name = "default",
						cmd = {"blender-addon-dev"},
						enable_dap = false,
					},
				},
				dap = {
					enabled = false,
				}
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"grapp-dev/nui-components.nvim",
			"mfussenegger/nvim-dap", -- Optional, for debugging with DAP
			"LiadOz/nvim-dap-repl-highlights", -- Optional, for syntax highlighting in the DAP REPL
		},
	},

	-- Neovim Plugin Development

	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"plenary",
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
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
		},
	},
}

return plugins
