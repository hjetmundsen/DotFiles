return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	keys = {
		{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
		{ "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
		{ "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
		{ "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
		{ "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
		{ "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				style_preset = bufferline.style_preset.minimal,
				mode = "tabs",
			},
		})
	end,
}
