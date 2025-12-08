local M = {}
M.formatters_by_ft = {
	lua = { "stylua" },
	javascript = { "deno_fmt", "biome" },
	typescript = { "deno_fmt", "biome" },
	astro = { "prettier" },
	svelte = { "biome", "prettier" },
	json = { "biome", "deno_fmt" },
	jsonc = { "biome", "deno_fmt" },
	typescriptreact = { "biome" },
	rust = { "rustfmt" },
	html = { "deno_fmt" },
	css = { "biome", "prettier" },
	scss = { "prettier" },
	cpp = { "clang-format" },
	c = { "clang-format" },
	xml = { "xmlformatter" },
	cs = { "csharpier" },
	fsharp = { "fantomas" },
	python = { "ruff_fix", "ruff_format", "ruff_organize_imports" }
}

return M
