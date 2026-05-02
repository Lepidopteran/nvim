return {
	"danymat/neogen",
	event = "BufReadPre",
	init = function()
		require("which-key").add({
			{ "<leader>lD", "<cmd>Neogen<cr>", desc = "Add Docstring" },
		})
	end,
	opts = {
		snippet_engine = "luasnip",
	},
}
