local M = {}
M.formatters_by_ft = {
	lua = { "stylua" },
	javascript = { "prettier", "deno_fmt", "biome" },
	typescript = { "prettier", "deno_fmt", "biome" },
	astro = { "prettier" },
	svelte = { "biome", "prettier" },
	json = { "biome", "deno_fmt", "prettier" },
	jsonc = { "biome", "deno_fmt", "prettier" },
	rust = { "rustfmt" },
	html = { "prettier" },
	css = { "biome", "prettier" },
	scss = { "prettier" },
	cpp = { "clang-format" },
	c = { "clang-format" },
	xml = { "xmlformatter" },
	cs = { "csharpier" },
	fsharp = { "fantomas" },
}

return M
