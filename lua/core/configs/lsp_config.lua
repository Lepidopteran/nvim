local lspconfig = require("lspconfig")
local blink = require("blink.cmp")
local capabilities = blink.get_lsp_capabilities()

-- Setup lsp servers
local servers = {
	"biome",
	"html",
	"cssls",
	"tailwindcss",
	"lua_ls",
	"pyright",
	"astro",
	"svelte",
	"clangd",
	"gdscript",
}

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = capabilities,
    })
end

-- Setup lsp servers with configs
local servers_with_configs = {
	-- TS
	ts_ls = {
		settings = {
			implicitProjectConfiguration = {
				checkJs = true,
			},
		},
	},

	-- Spelling
	typos_lsp = {
		init_options = {
			diagnosticSeverity = "hint",
		},
	},

	-- Rust
	rust_analyzer = {
		settings = {
			["rust-analyzer"] = {
				check = {
					command = "clippy",
				},
				diagnostics = {
					enable = true,
				},
			},
		},
	},
}

for server, config in pairs(servers_with_configs) do
	config.capabilities = blink.get_lsp_capabilities(config.capabilities)
	lspconfig[server].setup(config)
end

-- Setup lsp diagnostics signs
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
