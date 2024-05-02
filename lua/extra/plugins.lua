local mapping = require("extra.mapping")
wk = require("which-key")

local plugins = {
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("extra.configs.lsp_config")
		end,
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
}

return plugins
