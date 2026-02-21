local wk = require("which-key")
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

wk.add({
	{
		"<leader>gi",
		function()
			lazygit:toggle()
		end,
		desc = "LazyGit",
	},
})
