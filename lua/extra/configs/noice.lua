local M = {
	cmdline = {
		enabled = true,
		view = "cmdline",
	},
  lsp = {
		signature = {
			enabled = false,
		},
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    long_message_to_split = true,
  },
}

return M
