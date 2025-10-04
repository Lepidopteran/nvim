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

			local overseer = require("overseer")
			require("auto-session").setup({
				pre_save_cmds = {
					function()
						overseer.save_task_bundle(
							get_cwd_as_name(),
							-- Passing nil will use config.opts.save_task_opts. You can call list_tasks() explicitly and
							-- pass in the results if you want to save specific tasks.
							nil,
							{ on_conflict = "overwrite" } -- Overwrite existing bundle, if any
						)
					end,
				},
				-- Optionally get rid of all previous tasks when restoring a session
				pre_restore_cmds = {
					function()
						for _, task in ipairs(overseer.list_tasks({})) do
							task:dispose(true)
						end
					end,
				},
				post_restore_cmds = {
					function()
						overseer.load_task_bundle(get_cwd_as_name(), { ignore_missing = true })
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
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",
		opts = {
			keymap = {
				preset = "enter",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				list = {
					selection = { preselect = false, auto_insert = false },
				},
			},
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
			strategy = "toggleterm",
			task_list = {
				direction = "right"
			}
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
