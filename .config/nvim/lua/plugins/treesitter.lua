return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
			"json",
			"java",
			"javascript",
			"kotlin",
			"python",
			"typescript",
			"yaml",
		})
	end,
}
