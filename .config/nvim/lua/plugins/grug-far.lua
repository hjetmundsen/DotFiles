local grug = require("grug-far")

grug.setup({
	headerMaxWidth = 80,
})

-- <leader>F rather than something under <leader>s: <leader>s is itself a complete
-- mapping (replace word under cursor), so any <leader>s? binding would make every
-- <leader>s press wait out 'timeoutlen'.
local map = vim.keymap.set
map("n", "<leader>F", function()
	grug.open({})
end, { desc = "Find/replace in project" })
map("x", "<leader>F", function()
	grug.with_visual_selection({})
end, { desc = "Find/replace selection in project" })
