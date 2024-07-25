local M = {}

M.IconPicker = {
	{ "<leader>I", group = "Icon Picker"},
	{ "<leader>Ii", "<cmd>IconPickerNormal<CR>", desc = "Open Icon Picker" },
	{ "<leader>Iy", "<cmd>IconPickerYank<CR>", desc = "Yank the selected icon into register" },
	{ "<C-I>", "<cmd>IconPickerInsert<CR>", desc = "Insert Icon", mode = "i" },
}

M.ChatGPT = {
	{ "<leader>c", group = "ChatGPT"},
	{ "<leader>cc", "<cmd>ChatGPT<CR>", desc="ChatGPT"},
	{
		mode = {"n", "v"},
		{ "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc="Edit with instruction"},
		{ "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc="Grammar Correction"},
		{ "<leader>ct", "<cmd>ChatGPTRun translate<CR>", desc="Translate"},
		{ "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc="Keywords"},
		{ "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc="Docstring"},
		{ "<leader>ca", "<cmd>ChatGPTRun add_tests<CR>", desc="Add Tests"},
		{ "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc="Optimize Code"},
		{ "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc="Summarize"},
		{ "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc="Fix Bugs"},
		{ "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc="Explain Code"},
		{ "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc="Roxygen Edit"},
		{ "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc="Code Readability Analysis"},
	}
}

M.LazyGit = {
  { "<leader>g", group = "Git" },
  { "<leader>gi", "<cmd>LazyGit<CR>", desc = "LazyGit" },
}

M.ZenMode = {
	{ "<leader>z", group = "Zen Mode" },
	{ "<leader>zz", "<cmd>ZenMode<CR>", desc = "Toggle Zen Mode" },
	{ "<leader>zt", "<cmd>Twilight<CR>", desc = "Toggle Twilight" },
}

return M
