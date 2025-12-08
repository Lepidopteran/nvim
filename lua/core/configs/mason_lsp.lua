local M = {
	ensure_installed = {
		-- Lua
		"lua_ls",

		-- Markdown
		"marksman",

		-- Python

		"basedpyright",
		"ruff",

		-- Web Dev
		"biome",
		"html",
		"cssls",
		"ts_ls",
		"tailwindcss",
		"astro",
		"svelte",

		-- Config
		"jsonls",
		"yamlls",

		-- Java
		"jdtls",

		-- C/C++
		"clangd",

		-- C#
		"omnisharp",

		-- Rust
		"rust_analyzer",

		-- Spelling
		"typos_lsp",
	},

	automatic_enable = {
		"biome",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"basedpyright",
		"astro",
		"svelte",
		"clangd",
		"jdtls",
		"gdscript",
		"jsonls",
		"yamlls",
		"ruff",
	},
}

return M
