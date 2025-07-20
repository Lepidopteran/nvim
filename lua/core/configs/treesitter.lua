local M = {
	ensure_installed = {
		-- Web Development
		"astro",
		"css",
		"scss",
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
		"xml",

		-- Editor Specific
		"vim",
		"vimdoc",

		-- Shading and Rendering
		"gdshader",

		-- Java
		"java",

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
