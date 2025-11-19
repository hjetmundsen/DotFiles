return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")
		ts.install({
			"bash",
			"css",
			"dockerfile",
			"git_config",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"go",
			"html",
			"java",
			"javascript",
			"json",
			"jsx",
			"kotlin",
			"lua",
			"make",
			"markdown",
			"python",
			"rust",
			"sql",
			"terraform",
			"toml",
			"tsx",
			"typescript",
			"yaml",
		})
		ts.setup({
			fold = {
				enable = true,
			},
		})
	end,
}
