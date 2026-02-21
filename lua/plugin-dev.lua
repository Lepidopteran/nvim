local wk = require("which-key")

if string.match(vim.fn.getcwd(), "[.]nvim$") then
	vim.o.runtimepath = vim.o.runtimepath .. "," .. vim.fn.getcwd()
	wk.add({
		{ "<leader>P", "<cmd>write<CR><cmd>source %<CR>", desc = "Source File" },
	})
end
