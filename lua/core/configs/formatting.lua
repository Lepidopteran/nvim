local M = {}
M.formatters_by_ft = {
	lua = { "stylua" },
	javascript = { "biome", "deno_fmt", "prettier" },
	typescript = { "biome", "deno_fmt", "prettier" },
	astro = { "biome", "prettier" },
	svelte = { "biome", "prettier" },
	json = { "biome", "deno_fmt", "prettier" },
	jsonc = { "biome", "deno_fmt", "prettier" },
	rust = { "rustfmt" },
	html = { "prettier" },
	css = { "prettier" },
	cpp = { "clang-format" },
	c = { "clang-format" },
	xml = { "xmlformatter" },
}

return M
