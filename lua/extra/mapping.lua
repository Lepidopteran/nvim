local M = {}

M.IconPicker = {
	{ "<leader>I", group = "Icon Picker"},
	{ "<leader>Ii", "<cmd>IconPickerNormal<CR>", desc = "Open Icon Picker" },
	{ "<leader>Iy", "<cmd>IconPickerYank<CR>", desc = "Yank the selected icon into register" },
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
