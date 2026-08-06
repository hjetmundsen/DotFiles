require("blink.cmp").setup({
	keymap = { preset = "default" },

	appearance = {
		nerd_font_variant = "mono",
	},

	completion = {
		documentation = { auto_show = false },
		-- Explicit: with border = nil blink falls back to vim.o.winborder, which
		-- would put a rounded border on the completion popup.
		menu = { border = "none" },
	},

	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},

	-- Off by default in blink; shows the signature automatically while typing call
	-- arguments. The <C-k> mapping in jet/init.lua stays as the manual trigger.
	signature = { enabled = true },

	fuzzy = { implementation = "prefer_rust" },
})
