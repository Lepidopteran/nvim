local lspconfig = require("lspconfig")

local servers = {
	"tsserver",
	"biome",
	"html"
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{}
end
