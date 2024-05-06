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
			wk.register(mapping.ZenMode)
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
			})

			wk.register(mapping.ChatGPT)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
			},
		},
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
			wk.register(mapping.IconPicker, {
				noremap = true,
				silent = true,
			})
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
			}
		}
	},
}

return plugins
