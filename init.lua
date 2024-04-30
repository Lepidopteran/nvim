require("core")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("lazy").setup({
	{
		import = "core.plugins",
	},
	{
		import = "extra.plugins"
	}
})

vim.cmd("colorscheme kanagawa")

require("lualine").setup()

require("oil").setup()
require("nvim-tree").setup()
require("telescope").setup()
require("telescope").load_extension("fzf")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("mason").setup()
local mason_config = require("core.configs.mason_lsp")

require("mason-lspconfig").setup(mason_config)

require("core.configs.lsp_config")

