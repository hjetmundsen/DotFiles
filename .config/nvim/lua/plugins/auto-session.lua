return {
	"rmagatti/auto-session",
	lazy = false,
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
	},
	keys = {
		{ "<leader>qs", "<cmd>AutoSession search<cr>", desc = "Search sessions" },
		{ "<leader>qd", "<cmd>AutoSession delete<cr>", desc = "Delete session" },
	},
}
