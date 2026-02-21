local vim = vim

vim.g.termguicolors = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
require("lazy").setup({
	spec = {
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			init = function()
				require("which-key").add({
					{ "<C-s>", "<cmd>w<CR>", desc = "Save File" },
					{ "<esc>", "<cmd>noh<CR>", desc = "Clear Highlights" },
					{
						mode = { "n", "v" },
						{ "<leader>d", '"+d', desc = "Cut to clipboard" },
						{ "<leader>p", '"+p', desc = "Paste from clipboard" },
						{ "<leader>x", '"+x', desc = "Cut to clipboard" },
						{ "<leader>y", '"+y', desc = "Copy to clipboard" },
					},

					{ "p", "P", desc = "Paste without yanking", mode = "x" },
					{ "<leader>bc", "<cmd>bdelete<cr>", desc = "Close Buffer" },
					{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
					{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer" },
					{
						"<leader>bb",
						group = "buffers",
						expand = function()
							return require("which-key.extras").expand.buf()
						end,
					},
				})
			end,
			keys = {
				{
					"<leader>?",
					function()
						require("which-key").show({ global = false })
					end,
					desc = "Buffer Local Keymaps (which-key)",
				},
			},
		},
		{
			import = "plugins",
		},
	},
	defaults = { lazy = true },
})

require("lazygit")
require("plugin-dev")
require("tools")
