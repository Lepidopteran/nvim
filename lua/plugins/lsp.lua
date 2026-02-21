local wk = require("which-key")
return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		init = function()
			require("configs.lsp_config")
			require("which-key").add({
				{ "<leader>l", group = "lsp" },
				{ "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
				{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
				{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
				{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
				{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
				{
					"<leader>li",
					function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end,
					desc = "Toggle Inlay Hints",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = require("configs.mason_lsp"),
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {},
			},
			"neovim/nvim-lspconfig",
		},
	},
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
	{
		"saghen/blink.cmp",
		lazy = false,
		version = "v1.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
			snippets = { preset = "luasnip" },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
			},
		},
		dependencies = {
			"rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("configs.formatting"),
		init = function()
			wk.add({
				{
					"<leader>lf",
					"<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>",
					desc = "Format",
				},
			})
		end,
	},
}
