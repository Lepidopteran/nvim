return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		default_format_opts = {
			lsp_format = "fallback",
			stop_after_first = true,
			timeout_ms = 1000,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "dprint", "oxfmt" },
			javascriptreact = { "dprint", "oxfmt" },
			typescript = { "dprint", "oxfmt" },
			typescriptreact = { "dprint", "oxfmt" },
			astro = { "dprint", "prettier" },
			json = { "oxfmt" },
			jsonc = { "biome" },
			rust = { "rustfmt" },
			svelte = { "dprint", "prettier" },
			html = { "dprint", "biome", "oxfmt" },
			css = { "dprint", "biome", "oxfmt" },
			scss = { "dprint", "prettier" },
			cpp = { "clang-format" },
			c = { "clang-format" },
			xml = { "xmlformatter" },
			cs = { "csharpier" },
			fsharp = { "fantomas" },
			python = { "ruff_fix", "ruff_format", "ruff_organize_imports", stop_after_first = false },
		},
		formatters = {
			dprint = {
				condition = function()
					return vim.fs.find({ "dprint.json" })[1] ~= nil
				end,
			},
			biome = {
				condition = function()
					return vim.fs.find({ "biome.json" })[1] ~= nil
				end,
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({
					bufnr = args.buf,
				})
			end,
		})
	end,
}
