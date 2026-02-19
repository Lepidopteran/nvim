local servers = {
	-- TS
	ts_ls = {
		settings = {
			implicitProjectConfiguration = {
				checkJs = true,
			},
		},
	},

	-- Svelte
	svelte = {

		-- Typescript fix
		on_attach = function(client, bufnr)
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = { "*.js", "*.ts" },
				group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
				callback = function(ctx)
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
				end,
			})
		end,
		capabilities = {
			workspace = {
				didChangeWatchedFiles = vim.fn.has("nvim-0.10") == 0 and { dynamicRegistration = true },
			},
		},
	},

	-- Spelling
	typos_lsp = {
		init_options = {
			diagnosticSeverity = "hint",
		},
	},

	-- C#
	fsautocomplete = {},
	omnisharp = {
		handlers = {
			["textDocument/definition"] = function(...)
				return require("omnisharp_extended").handler(...)
			end,
		},
		keys = {
			{
				"gd",
				function()
					require("omnisharp_extended").lsp_definitions()
				end,
				desc = "Goto Definition",
			},
		},
		enable_roslyn_analyzers = true,
		organize_imports_on_format = true,
		enable_import_completion = true,
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

for server, config in pairs(servers) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
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
