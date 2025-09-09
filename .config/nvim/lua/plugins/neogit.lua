return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		"folke/snacks.nvim", -- optional
	},
	opts = {},
	keys = {
		{
			"<leader>gg",
			"<cmd>Neogit<cr>",
			desc = "Neogit",
		},
		{
			"<leader>gc",
			"<cmd>Neogit commit<cr>",
			desc = "Neogit commit",
		},
	},
}
