return {
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		init = function()
			require("configs.lsp_config")
			require("which-key").add({
				{ "<leader>l", group = "lsp" },
				{
					"<leader>lk",
					function()
						vim.lsp.buf.hover({
							border = "rounded",
						})
					end,
					desc = "Hover",
				},
				{
					"<leader>la",
					function()
						vim.lsp.buf.code_action()
					end,
					desc = "Code Action",
				},
				{
					"<leader>ld",
					function()
						vim.lsp.buf.definition()
					end,
					desc = "Go to Definition",
				},
				{
					"<leader>lr",
					function()
						vim.lsp.buf.rename()
					end,
					desc = "Rename",
				},
				{
					"<leader>ls",
					function()
						vim.lsp.buf.signature_help({
							border = "rounded",
						})
					end,
					desc = "Signature Help",
				},
				{
					"<leader>li",
					function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end,
					desc = "Toggle Inlay Hints",
				},
			})
		end,
	},
}
