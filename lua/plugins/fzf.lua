local wk = require("which-key")

return {
	"ibhagwan/fzf-lua",
	lazy = false,
	dependencies = { "mini.nvim/mini.icons" },
	init = function()
		wk.add({
			{ "<leader>f", group = "Search" },
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
			{ "<leader>frc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
			{ "<leader>frb", "<cmd>FzfLua git_branches<CR>", desc = "Branches" },
			{ "<leader>frs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
			{ "<leader>frf", "<cmd>FzfLua git_files<CR>", desc = "Files" },
			{ "<leader>ft", "<cmd>FzfLua treesitter<CR>", desc = "Treesitter" },
		})
	end,
	opts = {},
}
