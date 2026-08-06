require("diffview").setup({})

local map = vim.keymap.set

map("n", "<leader>gv", function()
	if require("diffview.lib").get_current_view() then
		vim.cmd("DiffviewClose")
	else
		vim.cmd("DiffviewOpen")
	end
end, { desc = "Toggle Diffview" })

map("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "File history (this file)" })
map("n", "<leader>gH", "<cmd>DiffviewFileHistory<cr>", { desc = "File history (repo)" })
