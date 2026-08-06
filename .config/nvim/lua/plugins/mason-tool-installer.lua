-- Formatters/linters referenced by plugins/conform.lua and plugins/lint.lua.
-- LSP servers are not listed here: mason-lspconfig auto-enables whatever is
-- installed, and servers are installed on demand via :Mason.
--
-- Deliberately absent: rustfmt and gofmt are not Mason packages (they ship with
-- the Rust and Go toolchains), so conform picks them up from PATH instead.
require("mason-tool-installer").setup({
	ensure_installed = {
		-- formatters (conform)
		"stylua",
		"prettier",
		"goimports",
		"google-java-format",
		"ktlint",
		"ruff", -- also the Python linter
		-- linters (nvim-lint)
		"eslint_d",
		"golangci-lint",
		-- debug adapters (nvim-dap)
		"delve",
		"debugpy",
	},
	run_on_start = true,
	-- Stagger installs so a cold start does not fire a dozen jobs at once.
	start_delay = 3000,
})
