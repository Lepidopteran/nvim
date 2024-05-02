local servers = {
	"astro",
}

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup{}
end
