local M = {
	ensure_installed = {
		-- Web Development
		"astro",
		"css",
		"html",
		"javascript",
		"svelte",
		"typescript",
		"vue",

		-- Scripting and Programming Languages
		"bash",
		"lua",
		"python",
		"rust",
		"gdscript",
		"c",
		"cpp",

		-- Markup and Configuration
		"dockerfile",
		"json",
		"jsonc",
		"markdown",
		"toml",
		"yaml",

		-- Editor Specific
		"vim",
		"vimdoc",

		-- Shading and Rendering
		"gdshader",

		-- Sql
		"sql",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
}

return M
