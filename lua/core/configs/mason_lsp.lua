local M = {
	ensure_installed = {
		-- Lua
		"lua_ls",

		-- Markdown
		"marksman",

		-- Python

		"pyright",

		-- Web Dev
		"biome",
		"html",
		"cssls",
		"ts_ls",
		"tailwindcss",
		"astro",
		"svelte",

		-- Java
		"jdtls",

		-- C/C++
		"clangd",

    -- Rust
    "rust_analyzer",

		-- Spelling
		"typos_lsp",
	},
	automatic_enable = false,
}

return M
