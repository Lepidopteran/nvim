local M = {}

M.general = {
	["<c-s>"] = {"<cmd>w<CR>", "Save File", silent = true},
}

M.buffer = {
	["<C-Tab>"] = {"<cmd>BufferNext<CR>", silent = true},
	["<C-S-Tab>"] = {"<cmd>BufferPrevious<CR>", silent = true},
	["<C-q>"] = {"<cmd>BufferClose<CR>", silent = true},
}

M.telescope = {
	["<leader>f"] = {
		name = "Telescope",
		f = {"<cmd>Telescope find_files<CR>", "Find Files"},
		g = {"<cmd>Telescope live_grep<CR>", "Live Grep"},
		b = {"<cmd>Telescope buffers<CR>", "Buffers"},
		h = {"<cmd>Telescope help_tags<CR>", "Help Tags"},
	}
}

M.trouble = {
	["<leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", "Diagnostics (Trouble)", },
	["<leader>xX"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", "Buffer Diagnostics (Trouble)", },
	["<leader>cs"] = { "<cmd>Trouble symbols toggle focus=false<cr>", "Symbols (Trouble)", },
	["<leader>cl"] = { "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", "LSP Definitions / references / ... (Trouble)", },
	["<leader>xL"] = { "<cmd>Trouble loclist toggle<cr>", "Location List (Trouble)", },
	["<leader>xQ"] = { "<cmd>Trouble qflist toggle<cr>", "Quickfix List (Trouble)", },
}

M.nvim_tree = {
	["<leader>e"] = {
		name = "Explorer",
		e = {"<cmd>NvimTreeToggle<CR>", "Toggle"},
		r = {"<cmd>NvimTreeRefresh<CR>", "Refresh"},
	}
}

return M
