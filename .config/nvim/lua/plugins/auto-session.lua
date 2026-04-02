require("auto-session").setup({
	suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
})

local map = vim.keymap.set
map("n", "<leader>qs", "<cmd>AutoSession search<cr>", { desc = "Search sessions" })
map("n", "<leader>qd", "<cmd>AutoSession delete<cr>", { desc = "Delete session" })
