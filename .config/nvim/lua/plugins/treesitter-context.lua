local tc = require("treesitter-context")

tc.setup({
	max_lines = 3,
	multiline_threshold = 1,
	trim_scope = "outer",
})

local map = vim.keymap.set
map("n", "<leader>cc", tc.toggle, { desc = "Toggle sticky context" })

-- [C, not [c: gitsigns owns [c/]c for hunk navigation.
map("n", "[C", function()
	tc.go_to_context(vim.v.count1)
end, { desc = "Jump to context" })
