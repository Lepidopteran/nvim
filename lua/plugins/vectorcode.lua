return {
	"Davidyz/VectorCode",
	version = "*",
	build = "uv tool install --upgrade vectorcode[lsp,mcp]",
	dependencies = { "nvim-lua/plenary.nvim" },
}
