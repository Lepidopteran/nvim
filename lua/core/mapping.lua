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
		h = { "<cmd>Telescope help_tags<CR>", "Help Tags" },
	},
}

M.trouble = {
	["<leader>t"] = {
		name = "Trouble",
		x = { "<cmd>TroubleToggle<CR>", "Toggle" },
		w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
		d = { "<cmd>TroubleToggle lsp_document_diagnostics<CR>", "Document Diagnostics" },
		l = { "<cmd>TroubleToggle loclist<CR>", "Location List" },
		q = { "<cmd>TroubleToggle quickfix<CR>", "Quickfix List" },
	},
	["<leader>cs"] = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)" },
	["<leader>cl"] = {
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		"LSP Definitions / references / ... (Trouble)",
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
