local wk = require("which-key")
return {
	"olimorris/codecompanion.nvim",
	version = "^18.0.0",
	init = function()
		wk.add({
			{ "<leader>a", group = "Artificial Intelligence", mode = { "n", "v" }, icon = "" },
		})
	end,
	keys = {
		{
			"<leader>ap",
			"<cmd>CodeCompanionActions<CR>",
			desc = "Actions",
		},
		{
			"<leader>aa",
			"<cmd>CodeCompanionChat Toggle<CR>",
			desc = "Toggle Code Companion Chat",
		},
		{
			"<leader>aa",
			"<cmd>CodeCompanionChat Add<CR>",
			desc = "Add Code to Chat",
			mode = { "v" },
		},
		{
			"<leader>ai",
			"<cmd>CodeCompanion<CR>",
			desc = "Code Companion Inline",
			mode = { "n", "v" },
		},
	},
	opts = {
		log_level = "DEBUG",
		adapters = {
			http = {
				["llama.cpp"] = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "http://127.0.0.1:9931",
							api_key = "TERM",
							chat_url = "/v1/chat/completions",
						},
						handlers = {
							parse_message_meta = function(self, data)
								local extra = data.extra
								if extra and extra.reasoning_content then
									data.output.reasoning = { content = extra.reasoning_content }
									if data.output.content == "" then
										data.output.content = nil
									end
								end
								return data
							end,
						},
					})
				end,
			},
		},
		display = {
			chat = {
				window = {
					position = "right",
				},
			},
		},
		interactions = {
			chat = {
				adapter = "llama.cpp",
			},
			inline = {
				adapter = "llama.cpp",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		{ "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = "[Image]($FILE_PATH)",
						use_absolute_path = true,
					},
				},
			},
		},
		{
			"saghen/blink.cmp",
			opts = {
				sources = {
					per_filetype = {
						codecompanion = { "codecompanion" },
					},
				},
			},
		},
	},
}
