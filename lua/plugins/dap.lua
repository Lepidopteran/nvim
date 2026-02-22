return {
	"mfussenegger/nvim-dap",
	event = "BufReadPre",
	config = function()
		require("dap").adapters.cpp = {
			type = "executable",
			command = "lldb-vscode",
		}
	end,
}
