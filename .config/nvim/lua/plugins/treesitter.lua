return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install(require("jet.languages").parsers())
		ts.setup({
			fold = {
				enable = true,
			},
		})
	end,
}
