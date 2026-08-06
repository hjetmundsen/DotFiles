require("conform").setup({
	formatters_by_ft = {
		go = { "goimports" }, -- supersets gofmt
		java = { "google-java-format" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		kotlin = { "ktlint" },
		lua = { "stylua" },
		-- "ruff" alone is a deprecated alias for ruff_fix (`ruff check --fix`), which
		-- applies lint fixes but does not format. ruff_format is the formatter.
		-- ruff_fix is deliberately omitted: with format_after_save it would delete
		-- imports you have added but not used yet. Add it back if you want autofixes.
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		-- NB: do not add a ["_"] = { "trim_whitespace" } fallback here. It would match
		-- every buffer, and `lsp_format = "fallback"` only uses the LSP formatter when
		-- *no* conform formatter resolves — so json/yaml/html/css/terraform/toml would
		-- silently lose LSP formatting. The BufWritePre autocmd in jet.init handles
		-- whitespace for filetypes conform does not cover.
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_after_save = {},
})
