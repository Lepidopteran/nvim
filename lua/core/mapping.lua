local M = {}

M.general = {
	["<C-s>"] = { "<cmd>w<CR>", "Save File", silent = true },
	["<esc>"] = { "<cmd>noh<CR>", "Clear Highlights", silent = true },
	["<leader>"] = {
		y = { '"+y', "Copy to clipboard", mode = { "n", "v" }},
		d = { '"+d', "Cut to clipboard", mode = { "n", "v" }},
		x = { '"+x', "Cut to clipboard", mode = { "n", "v" }},
		p = { '"+p', "Paste from clipboard", mode = { "n", "v" }},
	}
}

M.buffer = {
}

M.telescope = {
	["<leader>f"] = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files<CR>", "Find Files" },
		g = { "<cmd>Telescope live_grep<CR>", "Live Grep" },
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
		o = { "<cmd>Telescope oldfiles<CR>", "Old Files" },
		h = { "<cmd>Telescope frecency<CR>", "Frecency" },
		m = { "<cmd>Telescope marks<CR>", "Marks" },
		s = {
			name = "Symbols",
			d = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
			w = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
		},
		l = {
			name = "LSP",
			d = { "<cmd>Telescope lsp_definitions<CR>", "Definitions" },
			r = { "<cmd>Telescope lsp_references<CR>", "References" },
			i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
			t = { "<cmd>Telescope lsp_type_definitions<CR>", "Type Definitions" },
		},
		e = {
			name = "Extra",
			c = { "<cmd>Telescope commands<CR>", "Commands" },
			h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
			s = { "<cmd>Telescope highlights<CR>", "Highlights" },
			w = { "<cmd>Telescope spell_suggest<CR>", "Spell Suggest" },
		},
		r = {
			name = "Git",
			c = { "<cmd>Telescope git_commits<CR>", "Commits" },
			b = { "<cmd>Telescope git_branches<CR>", "Branches" },
			s = { "<cmd>Telescope git_status<CR>", "Status" },
			f = { "<cmd>Telescope git_files<CR>", "Files" },
		},
		t = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
	},
}

M.nvim_tree = {
	["<leader>e"] = {
		name = "Explorer",
		e = { "<cmd>NvimTreeToggle<CR>", "Toggle" },
		r = { "<cmd>NvimTreeRefresh<CR>", "Refresh" },
	},
}

M.lsp = {
	["<leader>l"] = {
		name = "LSP",
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
}

M.formatter = {
	["<leader>cf"] = { "<cmd>lua require('conform').format()<CR>", "Format" },
}

M.oil = {
	["<leader>e"] = {
		o = { "<cmd>Oil --float<CR>", "Open Oil" },
	},
}

return M
