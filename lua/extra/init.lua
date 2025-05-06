local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local wk = require("which-key")
local mapping = require("extra.mapping")
local _toggle_lazygit = function()
	lazygit:toggle()
end

vim.api.nvim_create_user_command('LazyGit', _toggle_lazygit, {});
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

if string.match(vim.fn.getcwd(), "[.]nvim$") then
	vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.fn.getcwd()
	wk.add({
		{"<leader>P", "<cmd>write<CR><cmd>source %<CR>", desc = "Source File"}
	})
end

wk.add(mapping.LazyGit)

if vim.g.neovide then
	vim.g.guifont = "JetBrainsMono Nerd Font:h12"
end
