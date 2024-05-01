local lspconfig = require("lspconfig")

local servers = {
	"tsserver",
	"biome",
	"html",
	"cssls",
	"lua_ls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{}
end
