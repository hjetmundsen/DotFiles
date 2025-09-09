return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			go = { "gofmt", "goimports" },
			java = { "google-java-format" },
			javascript = { "prettier" },
			kotlin = { "ktlint" },
			lua = { "stylua" },
			python = { "ruff" },
			rust = { "rustfmt" },
			typescript = { "prettier" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500 },
	},
}
