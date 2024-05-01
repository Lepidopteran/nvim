local mapping = require("core.mapping")
local plugins = {

	-- File Management

	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({})
			require("which-key").register(mapping.oil)
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
			require("nvim-tree").setup {}
			require("which-key").register(mapping.nvim_tree)
		end,
	},

	-- Utilites

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		init = function()
			require("telescope").setup {}
			require("which-key").register(mapping.telescope)
		end
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		init = function() require("telescope").load_extension("fzf") end
	},

	-- Editor Specific

	{
		"numToStr/Comment.nvim",
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		config = function()
			require("gitsigns").setup()
		end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function ()
			vim.o.time = true
			vim.o.timeoutlen = 300
		end
	},
	{
		"nvim-lua/plenary.nvim"
	},

	-- Language Server Related

	{
		"nvimtools/none-ls.nvim",
		event = "BufEnter"
	},
	{
		"folke/trouble.nvim",
		branch = "dev",
		init = function ()
			require("which-key").register(mapping.trouble)
		end,
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp"
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
		config = function ()
			require("core.configs.nvim-cmp")
		end
	},

	-- User Interface 

	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		init = function() require('lualine').setup {} end
	},

	-- Theme

	{
		"rebelot/kanagawa.nvim",
		init = function() vim.cmd("colorscheme kanagawa") end
	}
}

return plugins
