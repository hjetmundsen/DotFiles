require("conform").setup({
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
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_after_save = { lsp_fallback = true },
})
