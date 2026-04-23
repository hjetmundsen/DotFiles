local blink_cmp = require("blink.cmp")
local capabilities =
	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink_cmp.get_lsp_capabilities())

require("fidget").setup({})

require("mason").setup()
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
			})
		end,

		-- TODO: Remove once OTP 28 Dialyzer crash is fixed: https://github.com/erlang/otp/issues/9929
		["elixirls"] = function()
			require("lspconfig").elixirls.setup({
				capabilities = capabilities,
				settings = {
					elixirLS = {
						dialyzerEnabled = false,
					},
				},
			})
		end,

		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "it", "describe", "before_each", "after_each" },
						},
					},
				},
			})
		end,
	},
})

vim.diagnostic.config({
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})
