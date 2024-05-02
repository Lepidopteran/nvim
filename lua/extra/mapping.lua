local M = {}

M.IconPicker = {
	n = {
		["<Leader><Leader>i"] = { "<cmd>IconPickerNormal<cr>", "Open Icon Picker" },
		["<Leader><Leader>y"] = { "<cmd>IconPickerYank<cr>", "Yank the selected icon into register" },
	},
	["<C-I>"] = { "<cmd>IconPickerInsert<cr>", "Insert Icon" },
}

