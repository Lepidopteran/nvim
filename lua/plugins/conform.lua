local wk = require("which-key")

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		format_on_save = {
			timeout_ms = 500,
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "oxfmt", stop_after_first = true },
			javascriptreact = { "oxfmt" },
			typescript = { "oxfmt", stop_after_first = true },
			typescriptreact = { "oxfmt" },
			astro = { "prettier" },
			svelte = { "biome", "prettier" },
			json = { "oxfmt" },
			jsonc = { "biome" },
			rust = { "rustfmt" },
			html = { "oxfmt" },
			css = { "oxfmt" },
			scss = { "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			xml = { "xmlformatter" },
			cs = { "csharpier" },
			fsharp = { "fantomas" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
		},
		formatters = {
			dprint = {
				---@param ctx conform.Context
				condition = function(ctx)
					local dprint_config = vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
					return dprint_config ~= nil
				end,
			},
		},
	},

	init = function()
		local conform = require("conform")
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})

		wk.add({
			{
				"<leader>lf",
				function()
					conform.format({ async = true, lsp_format = "first" })
				end,
				desc = "Format",
			},
		})
	end,
}
