local gitsigns = require("gitsigns")

gitsigns.setup({
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 500,
	},
})

local map = vim.keymap.set

-- Hunk navigation. In diff mode ]c/[c are Vim's own change motions, so fall
-- through to them rather than shadowing them.
map("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Next hunk" })
map("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Prev hunk" })

map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this file" })

map("n", "<leader>gb", function()
	gitsigns.blame_line({ full = true })
end, { desc = "Blame line" })
map("n", "<leader>gB", gitsigns.toggle_current_line_blame, { desc = "Toggle inline blame" })

-- stage_hunk also unstages when invoked on a staged hunk, which is why there is
-- no separate undo mapping (gitsigns.undo_stage_hunk is deprecated).
map("n", "<leader>ga", gitsigns.stage_hunk, { desc = "Stage/unstage hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
map("v", "<leader>ga", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Stage/unstage selected hunk" })
map("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Reset selected hunk" })

map("n", "<leader>gA", gitsigns.stage_buffer, { desc = "Stage buffer" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

-- Hunk text object: dih, vih, ...
map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Hunk" })
