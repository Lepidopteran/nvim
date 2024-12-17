local mapping = require("extra.mapping")
wk = require("which-key")

local plugins = {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			local config = require("extra.configs.notify")
			require("notify").setup(config)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			local config = require("extra.configs.noice")
			require("noice").setup(config)
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"folke/which-key.nvim",
		config = function()
			wk.add(mapping.ZenMode)
		end,
	},
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
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "bw get notes chatgpt.nvim --raw",
				openai_params = {
					model = "gpt-4o-mini",
					max_tokens = 1024,
				},
				openai_edit_params = {
					model = "gpt-3.5-turbo",
					max_tokens = 2048,
				},
			})

			wk.add(mapping.ChatGPT)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
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
	{
		"ziontee113/icon-picker.nvim",
		event = "BufEnter",
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
			wk.add(mapping.IconPicker)
		end,
	},
	{
		"kkoomen/vim-doge",
		cmd = { "DogeGenerate", "DogeCreateDocStandard" },
		ft = { "python", "javascript", "typescript", "rust", "go", "lua", "c", "cpp", "java", "html" },
		build = function()
			vim.cmd("call doge#install()")
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		lazy = true,
		ft = { "markdown" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Obsidian/Personal",
				},
				{
					name = "work",
					path = "~/Obsidian/Work",
				},
			},
		},
	},
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
}

return plugins
