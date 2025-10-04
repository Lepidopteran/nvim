local M = {}

M.general = {
	{ "<C-s>", "<cmd>w<CR>", desc = "Save File" },
	{ "<esc>", "<cmd>noh<CR>", desc = "Clear Highlights" },
	{
		mode = { "n", "v" },
		{ "<leader>d", '"+d', desc = "Cut to clipboard" },
		{ "<leader>p", '"+p', desc = "Paste from clipboard" },
		{ "<leader>x", '"+x', desc = "Cut to clipboard" },
		{ "<leader>y", '"+y', desc = "Copy to clipboard" },
	},

	{ "p", "P", desc = "Paste without yanking", mode = "x" },
}

M.trouble = {
	{
		"<leader>t",
		group = "Trouble",
	},
	{
		"<leader>tt",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics (Trouble)",
	},
	{
		"<leader>tT",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics (Trouble)",
	},
	{
		"<leader>tc",
		"<cmd>Trouble todo toggle<cr>",
	},
	{
		"<leader>ts",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols (Trouble)",
	},
	{
		"<leader>tl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / references / ... (Trouble)",
	},
	{
		"<leader>tL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List (Trouble)",
	},
	{
		"<leader>tQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List (Trouble)",
	},
}

M.fzf_lua = {
	{ "<leader>f", group = "Search" },
	{ "<leader>fc", "<cmd>TodoFzfLua<CR>", desc = "Find Todo" },
	{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers" },
	{ "<leader>fo", "<cmd>FzfLua oldfiles<CR>", desc = "Old Files" },
	{ "<leader>fm", "<cmd>FzfLua marks<CR>", desc = "Marks" },
	{ "<leader>fz", "<cmd>FzfLua zoxide<CR>", desc = "Zoxide" },
	{ "<leader>fS", group = "Symbols" },
	{ "<leader>fSd", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
	{ "<leader>fSw", "<cmd>FzfLua lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
	{ "<leader>fl", group = "LSP" },
	{ "<leader>fld", "<cmd>FzfLua lsp_definitions<CR>", desc = "Definitions" },
	{ "<leader>flr", "<cmd>FzfLua lsp_references<CR>", desc = "References" },
	{ "<leader>fli", "<cmd>FzfLua lsp_implementations<CR>", desc = "Implementations" },
	{ "<leader>flt", "<cmd>FzfLua lsp_type_definitions<CR>", desc = "Type Definitions" },
	{ "<leader>fe", group = "Extra" },
	{ "<leader>fec", "<cmd>FzfLua commands<CR>", desc = "Commands" },
	{ "<leader>feh", "<cmd>FzfLua help_tags<CR>", desc = "Help Tags" },
	{ "<leader>fes", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
	{ "<leader>few", "<cmd>FzfLua spell_suggest<CR>", desc = "Spell Suggest" },
	{ "<leader>fr", group = "Git" },
	{
		{ "<leader>frc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
		{ "<leader>frb", "<cmd>FzfLua git_branches<CR>", desc = "Branches" },
		{ "<leader>frs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
		{ "<leader>frf", "<cmd>FzfLua git_files<CR>", desc = "Files" },
		{ "<leader>ft", "<cmd>FzfLua treesitter<CR>", desc = "Treesitter" },
	},
}

M.buffer = {
	{ "<leader>bs", "<cmd>FzfLua buffers<cr>", desc = "Find Buffer" },
	{ "<leader>bc", "<cmd>bdelete<cr>", desc = "Close Buffer" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer" },
	{
		"<leader>bb",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
}

M.lsp = {
	{ "<leader>l", group = "lsp" },
	{ "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
	{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
	{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
}

M.formatter = {
	{ "<leader>lf", "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>", desc = "Format" },
}

M.oil = {
	{ "<leader>eo", "<cmd>Oil --float<CR>", desc = "Open Oil" },
}

M.gitsigns = {
	{ "<leader>g", group = "Git" },
	{ "<leader>gD", "<cmd>lua require('gitsigns').diffthis()<CR>", desc = "Diff" },
	{ "<leader>gR", group = "Reset" },
	{ "<leader>gRb", "<cmd>lua require('gitsigns').reset_buffer()<CR>", desc = "Reset Buffer" },
	{ "<leader>gRh", "<cmd>lua require('gitsigns').reset_hunk()<CR>", desc = "Reset Hunk" },
	{ "<leader>gS", group = "Stage" },
	{ "<leader>gSb", "<cmd>lua require('gitsigns').stage_buffer()<CR>", desc = "Stage Buffer" },
	{ "<leader>gSh", "<cmd>lua require('gitsigns').stage_hunk()<CR>", desc = "Stage Hunk" },
	{ "<leader>gb", "<cmd>lua require('gitsigns').blame_line()<CR>", desc = "Toggle Blame" },
	{ "<leader>gd", "<cmd>lua require('gitsigns').toggle_deleted()<CR>", desc = "Diff" },
	{ "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", desc = "Preview Hunk" },
}

M.groups = {
	{ "<leader>s", group = "Session" },
	{ "<leader>e", group = "Filesystem" },
	{ "<leader>a", group = "Avante" },
	{ "<leader>o", group = "Overseer" },
}

return M
