local lspconfig = require("lspconfig")

local servers = {
	"tsserver",
	"biome",
	"html",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"astro",
	"svelte",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{}
end

lspconfig.typos_lsp.setup({
	init_options = {
		diagnosticSeverity = "hint",
	}
})
