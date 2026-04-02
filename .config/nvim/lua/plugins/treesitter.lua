local ts = require("nvim-treesitter")
ts.install(require("jet.languages").parsers())
ts.setup({
	fold = {
		enable = true,
	},
})
