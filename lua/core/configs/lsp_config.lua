local lspconfig = require("lspconfig")

local servers = {
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
	lspconfig[lsp].setup({})
end

-- TypeScript LSP

lspconfig.tsserver.setup({
	settings = {
		implicitProjectConfiguration = {
			checkJs = true,
		},
	},
})

-- Typos LSP

lspconfig.typos_lsp.setup({
	init_options = {
		diagnosticSeverity = "hint",
	},
})

local signs = {
	Error = " ",
	Warn = " ",
	Hint = " ",
	Info = " ",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
