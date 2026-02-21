return {
	{
		"b0o/blender.nvim",
		opts = {
			profiles = {
				{
					name = "default",
					cmd = { "blender-addon-dev" },
					enable_dap = false,
				},
			},
			dap = {
				enabled = false,
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"grapp-dev/nui-components.nvim",
			"mfussenegger/nvim-dap",
			"LiadOz/nvim-dap-repl-highlights",
		},
	},
}
