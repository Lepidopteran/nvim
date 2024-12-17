local mapping = require("core.mapping")
local plugins = {

	-- File Management

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({})
			require("which-key").add(mapping.oil)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
			require("which-key").add(mapping.nvim_tree)
		end,
	},

	-- Utilities

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").setup({})
			require("which-key").add(mapping.telescope)
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		init = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
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

	-- Language Server Related

	{
		"nvimtools/none-ls.nvim",
		event = "BufEnter",
	},
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
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local config = require("core.configs.mason_lsp")

			require("mason-lspconfig").setup(config)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			require("which-key").add(mapping.lsp)
			require("core.configs.lsp_config")
		end,

		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("core.configs.nvim-cmp")
		end,
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
			vim.cmd("colorscheme kanagawa")
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
			opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		config = function()
			require("nvim-ts-autotag").setup({})
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
	{
		"folke/which-key.nvim",
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
		end,
	},
}

return plugins
