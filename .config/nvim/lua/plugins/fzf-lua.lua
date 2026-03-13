return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-mini/mini.icons" },
	lazy = false,
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").git_files()
			end,
			desc = "Git Files",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").git_worktrees()
			end,
			desc = "Git Worktrees",
		},
		{
			"<leader>fs",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fr",
			function()
				require("fzf-lua").lsp_references()
			end,
			desc = "Lsp References",
		},
	},
	opts = {},
}
