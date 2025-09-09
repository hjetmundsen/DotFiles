return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
			"bash",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"go",
			"java",
			"javascript",
			"json",
			"kotlin",
			"lua",
			"make",
			"markdown",
			"python",
			"rust",
			"sql",
			"terraform",
			"toml",
			"typescript",
			"yaml",
		})
	end,
}
