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

		-- Formatting
		"dprint",

		-- Java
		"jdtls",
		"gradle_ls",

		-- C/C++
		"clangd",

		-- C# disabled for now till the registry gets updated
		-- "omnisharp",

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
