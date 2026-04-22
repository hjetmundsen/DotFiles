local bufferline = require("bufferline")
bufferline.setup({
	options = {
		style_preset = bufferline.style_preset.minimal,
		mode = "tabs",
	},
})

local map = vim.keymap.set
map("n", "<leader>bb", "<cmd>BufferLinePick<cr>", { desc = "Pick tab" })
map("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
map("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev tab" })
map("n", "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close tabs to the left" })
map("n", "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", { desc = "Close tabs to the right" })
map("n", "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close other tabs" })
