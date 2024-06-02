
local vim = vim

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000

vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", ";", ":")

require("os-extras")
require("core")

require("lazy").setup({
	{
		import = "core.plugins",
	},
	{
		import = "extra.plugins"
	}
})

require("extra")

