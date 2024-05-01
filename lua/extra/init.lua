local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local gitui = Terminal:new({ cmd = "gitui", hidden = true, direction = "float" })
local _toggle_lazygit = function()
	lazygit:toggle()
end

local _toggle_gitui = function()
	gitui:toggle()
end

vim.api.nvim_create_user_command('LazyGit', _toggle_lazygit, {});
vim.api.nvim_create_user_command('GitUI', _toggle_gitui, {});

if vim.g.neovide then
	vim.g.guifont = "JetBrainsMono Nerd Font:h12"
end

require("extra.windows")
