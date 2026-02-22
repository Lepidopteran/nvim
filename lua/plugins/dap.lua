local dap = require("dap")

return {
	"mfussenegger/nvim-dap",
	event = "BufReadPre",
	init = function()
		dap.adapters.codelldb = {
			type = "executable",
			command = "codelldb",
		}
	end,
}
