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

M.telescope = {
	{"<leader>f", group="Telescope" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
	{ "<leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Old Files" },
	{ "<leader>fh", "<cmd>Telescope frecency<CR>", desc = "Frecency" },
	{ "<leader>fm", "<cmd>Telescope marks<CR>", desc = "Marks" },
	{ "<leader>fs", group="Symbols" },
	{ "<leader>fsd", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document Symbols" },
	{ "<leader>fsw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols" },
	{ "<leader>fl", group="LSP" },
	{ "<leader>fld", "<cmd>Telescope lsp_definitions<CR>", desc = "Definitions" },
	{ "<leader>flr", "<cmd>Telescope lsp_references<CR>", desc = "References" },
	{ "<leader>fli", "<cmd>Telescope lsp_implementations<CR>", desc = "Implementations" },
	{ "<leader>flt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Type Definitions" },
	{ "<leader>fe", group="Extra" },
	{ "<leader>fec", "<cmd>Telescope commands<CR>", desc = "Commands" },
	{ "<leader>feh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
	{ "<leader>fes", "<cmd>Telescope highlights<CR>", desc = "Highlights" },
	{ "<leader>few", "<cmd>Telescope spell_suggest<CR>", desc = "Spell Suggest" },
	{ "<leader>fr", group="Git" },
	{ "<leader>frc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
	{ "<leader>frb", "<cmd>Telescope git_branches<CR>", desc = "Branches" },
	{ "<leader>frs", "<cmd>Telescope git_status<CR>", desc = "Status" },
	{ "<leader>frf", "<cmd>Telescope git_files<CR>", desc = "Files" },
	{ "<leader>ft", "<cmd>Telescope treesitter<CR>", desc = "Treesitter" },
}

M.buffer = {
	{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find Buffer" },
	{ "<leader>bc", "<cmd>bdelete<cr>", desc = "Close Buffer" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Previous Buffer" },
}

M.nvim_tree = {
	{ "<leader>e", group="file" },
	{ "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle" },
	{ "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh" },
	{ "<leader>ef", "<cmd>NvimTreeFindFile<CR>", desc = "Find File" },
}

M.lsp = {
	{ "<leader>l", group="lsp"},
	{ "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
	{ "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to Definition" },
	{ "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
	{ "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature Help" },
}

M.formatter = {
	{"<leader>lf", "<cmd>lua require('conform').format()<CR>", desc = "Format" },
}

M.oil = {
	{"<leader>eo","<cmd>Oil --float<CR>", desc = "Open Oil" },
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

return M
