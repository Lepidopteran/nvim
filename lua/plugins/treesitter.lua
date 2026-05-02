return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/nvim-treesitter-context",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		init = function()
			local config = require("configs.treesitter")
			local languages = config.languages
			local configs = config.configs

			require("nvim-treesitter").install(languages)

			for _, lang in ipairs(languages) do
				local lang_config = configs and configs[lang]
				if lang_config then
					for _, value in ipairs(lang_config) do
						languages[#languages + 1] = value
					end
					vim.treesitter.language.register(lang, lang_config)
				end
			end

			vim.api.nvim_create_autocmd("FileType", {
				pattern = languages,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
		build = ":TSUpdate",
	},
}
