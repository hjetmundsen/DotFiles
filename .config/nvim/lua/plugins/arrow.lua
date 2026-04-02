require("arrow").setup({
	show_icons = true,
	leader_key = "<C-e>",
	buffer_leader_key = "m",
	per_buffer_config = {
		treesitter_context = { "function", "class" },
	},
})

local map = vim.keymap.set
map("n", "<C-h>", function() require("arrow.persist").go_to(1) end, { desc = "Arrow file 1" })
map("n", "<C-t>", function() require("arrow.persist").go_to(2) end, { desc = "Arrow file 2" })
map("n", "<C-n>", function() require("arrow.persist").go_to(3) end, { desc = "Arrow file 3" })
map("n", "<C-s>", function() require("arrow.persist").go_to(4) end, { desc = "Arrow file 4" })
