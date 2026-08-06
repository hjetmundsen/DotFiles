local bufferline = require("bufferline")
bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.minimal,
		mode = "tabs",
		-- Hides the tabline when only one tab is open; bufferline manages
		-- 'showtabline' itself, so no TabNew/TabClosed autocmds are needed.
		always_show_bufferline = false,
	},
})

-- All tab keys share the <leader>t prefix; <leader>tc (close) is in jet/remap.lua.
local map = vim.keymap.set
map("n", "<leader>tt", "<cmd>BufferLinePick<cr>", { desc = "Pick tab" })
map("n", "<leader>tn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
map("n", "<leader>tp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev tab" })
map("n", "<leader>tol", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close tabs to the left" })
map("n", "<leader>tor", "<cmd>BufferLineCloseRight<cr>", { desc = "Close tabs to the right" })
map("n", "<leader>too", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other tabs" })
