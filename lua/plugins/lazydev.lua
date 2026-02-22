return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				"plenary",
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		opts = {
			sources = {
				per_filetype = {
					lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
}
