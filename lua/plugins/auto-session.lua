local wk = require("which-key")
return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>sr", "<cmd>AutoSession load<cr>", desc = "Load Session" },
		{ "<leader>sT", "<cmd>AutoSession new<cr>", desc = "New Session" },
		{ "<leader>sd", "<cmd>AutoSession delete<cr>", desc = "Delete Session" },
		{ "<leader>sD", "<cmd>AutoSession deletePicker<cr>", desc = "Pick Session to Delete" },
		{ "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save Session" },
		{ "<leader>sS", "<cmd>AutoSession search<cr>", desc = "Search Sessions" },
	},
	init = function()
		wk.add({
			{ "<leader>s", group = "Session" },
		})
	end,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		pre_save_cmds = {
			function()
				local tasks = require("overseer.task_list").list_tasks()
				local cmds = {}
				for _, task in ipairs(tasks) do
					local json = vim.json.encode(task:serialize())
					json = string.gsub(json, "\\/", "/")
					json = string.gsub(json, "'", "\\'")
					table.insert(
						cmds,
						string.format("lua require('overseer').new_task(vim.json.decode('%s')):start()", json)
					)
				end
				return cmds
			end,
		},
		pre_restore_cmds = {
			function()
				for _, task in ipairs(require("overseer").list_tasks({})) do
					task:dispose(true)
				end
			end,
		},
		-- log_level = 'debug',
	},
}
