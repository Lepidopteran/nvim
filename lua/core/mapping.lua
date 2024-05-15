local M = {}

M.general = {
	["<C-s>"] = { "<cmd>w<CR>", "Save File" },
	["<esc>"] = { "<cmd>noh<CR>", "Clear Highlights" },
	["<leader>"] = {
		y = { '"+y', "Copy to clipboard", mode = { "n", "v" } },
		d = { '"+d', "Cut to clipboard", mode = { "n", "v" } },
		x = { '"+x', "Cut to clipboard", mode = { "n", "v" } },
		p = { '"+p', "Paste from clipboard", mode = { "n", "v" } },
	},
	p = { "P", "Paste without yanking", mode = { "x" }, silent = true },
}

M.buffer = {
	["<leader>b"] = {
		c = { "<cmd>bdelete<CR>", "Close Buffer" },
		n = { "<cmd>bnext<CR>", "Next Buffer" },
		p = { "<cmd>bprevious<CR>", "Previous Buffer" },
		b = { "<cmd>Telescope buffers<CR>", "Find Buffer" },
	},
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
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover", silent = true, noremap = true },
	["<leader>l"] = {
		name = "LSP",
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition", silent = true, noremap = true },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename", silent = true, noremap = true },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help", silent = true, noremap = true },
	},
}

M.formatter = {
	["<leader>lf"] = { "<cmd>lua require('conform').format()<CR>", "Format" },
}

M.oil = {
	["<leader>e"] = {
		o = { "<cmd>Oil --float<CR>", "Open Oil" },
	},
}

M.gitsigns = {
	["<leader>g"] = {
		name = "Git",
		b = { "<cmd>lua require('gitsigns').blame_line()<CR>", "Toggle Blame" },
		d = { "<cmd>lua require('gitsigns').toggle_deleted()<CR>", "Diff" }, 
		p = { "<cmd>lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk" },
		D = { "<cmd>lua require('gitsigns').diffthis()<CR>", "Diff" },
		R = {
			name = "Reset",
			b = { "<cmd>lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer" },
			h = { "<cmd>lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
		},
		S = {
			name = "Stage",
			b = { "<cmd>lua require('gitsigns').stage_buffer()<CR>", "Stage Buffer" },
			h = { "<cmd>lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
		},
	},
}

return M
