return {
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
		"oxlint",
		"dprint",
		"html",
		"cssls",
		"ts_ls",
		"tailwindcss",
		"astro",
		"svelte",

		-- Config
		"groovyls",
		"jsonls",
		"yamlls",

		-- Java
		"jdtls",
		"gradle_ls",

		-- C/C++
		"clangd",

		-- C#
		"omnisharp",

		-- Spelling
		"typos_lsp",

		-- UI
		"slint_lsp",
	},

	automatic_enable = {
		"biome",
		"oxlint",
		"dprint",
		"slint_lsp",
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
		"gradle_ls",
		"groovyls",
	},
}
