require("fidget").setup({})

require("mason").setup()

-- mason-lspconfig v2 auto-enables every installed server via `vim.lsp.enable()`.
-- Per-server tweaks go through `vim.lsp.config()` below, NOT a `handlers` table
-- (that setting was removed in v2 and is silently ignored).
require("mason-lspconfig").setup({})

-- blink.cmp 1.0 does not register its capabilities automatically, so merge them
-- into the wildcard config. Nvim already supplies its own defaults underneath.
vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "it", "describe", "before_each", "after_each" },
			},
		},
	},
})

-- Java: no LSP configured yet. Mason's `kotlin-lsp` package already ships
-- JetBrains' `intellij-server` (build 262.9593.0) and bundles plugins/java, but
-- Java features are inert in that Apache-2.0 build — verified 2026-08-05: in one
-- mixed Gradle project the same server returned diagnostics/hover/documentSymbol
-- for .kt and nothing at all for .java.
--
-- The Java-capable build is the preview VS Code extension JetBrains.intellij-server
-- (Toolbox license, 30-day expiry, IDEA Ultimate after 1.0) and is not in
-- mason-registry. Revisit when a package lands; until then Kotlin works as-is.

vim.diagnostic.config({
	float = {
		focusable = false,
		style = "minimal",
		-- border comes from 'winborder' (see lua/jet/set.lua)
		source = true,
		header = "",
		prefix = "",
	},
})
