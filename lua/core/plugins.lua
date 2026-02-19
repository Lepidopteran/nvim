local mapping = require("core.mapping")
local plugins = {

	-- File Management

	{
		"stevearc/oil.nvim",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("oil").setup({})
			require("which-key").add(mapping.oil)
		end,
	},

	-- Utilities

	{
		"folke/which-key.nvim",
		lazy = false,
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		init = function()
			local wk = require("which-key")
			wk.add(mapping.general)
			wk.add(mapping.buffer)
			wk.add(mapping.groups)
		end,
	},

	{
		"ibhagwan/fzf-lua",
		dependencies = { "echasnovski/mini.icons" },
		config = function()
			require("which-key").add(mapping.fzf_lua)
		end,
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				direction = "float",
				float_opts = {
					border = "rounded",
					winblend = 3,
					highlights = {
						border = "Normal",
						background = "Normal",
					},
				},
			})
		end,
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		keys = {
			{ "<leader>s", group = "Session" },
			{ "<leader>sr", "<cmd>AutoSession load<cr>", desc = "Load Session" },
			{ "<leader>sT", "<cmd>AutoSession new<cr>", desc = "New Session" },
			{ "<leader>sd", "<cmd>AutoSession delete<cr>", desc = "Delete Session" },
			{ "<leader>sD", "<cmd>AutoSession deletePicker<cr>", desc = "Pick Session to Delete" },
			{ "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save Session" },
			{ "<leader>sS", "<cmd>AutoSession search<cr>", desc = "Search Sessions" },
		},

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- log_level = 'debug',
		},
		config = function()
			local function get_cwd_as_name()
				local dir = vim.fn.getcwd(0)
				return dir:gsub("[^A-Za-z0-9]", "_")
			end

			require("auto-session").setup({
				pre_save_cmds = {
					function()
						local tasks = require("overseer.task_list").list_tasks()
						local cmds = {}
						for _, task in ipairs(tasks) do
							local json = vim.json.encode(task:serialize())
							json = string.gsub(json, "\\/", "/")
							json = string.gsub(json, "'", "\\'")
							table.insert(
								cmds,
								string.format("lua require('overseer').new_task(vim.json.decode('%s')):start()", json)
							)
						end
						return cmds
					end,
				},
				pre_restore_cmds = {
					function()
						for _, task in ipairs(require("overseer").list_tasks({})) do
							task:dispose(true)
						end
					end,
				},
			})
		end,
	},

	-- Language Server Related

	{
		"folke/trouble.nvim",
		command = { "Trouble" },
		config = function()
			require("trouble").setup({})
			require("which-key").add(mapping.trouble)
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opt = {},
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			local config = require("core.configs.mason")
			require("mason").setup(config)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = require("core.configs.mason_lsp"),
		dependencies = {
			"williamboman/mason.nvim",
			opts = require("core.configs.mason"),
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},

		config = function()
			require("which-key").add(mapping.lsp)
			require("core.configs.lsp_config")
		end,
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim", ft = "cs", opts = nil },
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
				default = { "lsp", "path", "snippets", "buffer" },
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
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			local config = require("core.configs.formatting")

			conform.setup(config)

			require("which-key").add(mapping.formatter)
		end,
	},

	-- Debugging

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

	-- Git Related

	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup()
			require("which-key").add(mapping.gitsigns)
		end,
	},

	-- User Interface

	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			local config = require("core.configs.notify")
			require("notify").setup(config)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			local config = require("core.configs.noice")
			require("noice").setup(config)
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"rcarriga/nvim-notify",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},

	-- Theme

	{
		"rebelot/kanagawa.nvim",
		config = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},

	-- Editor Specific

	{
		"numToStr/Comment.nvim",
		event = "BufReadPre",
		config = function()
			require("Comment").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("core.configs.treesitter")

			require("nvim-treesitter.configs").setup(config)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		config = function()
			require("treesitter-context").setup({})
		end,
	},
	{
		"RRethy/vim-illuminate",
		event = "BufReadPre",
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "BufReadPre",
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = false,
				},
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufReadPre",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}

return plugins
