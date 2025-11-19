return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	keys = {
		{
			"<leader>bb",
			"<cmd>BufferLinePick<cr>",
		},
		{
			"<leader>bn",
			"<cmd>BufferLineCycleNext<cr>",
		},
		{
			"<leader>bp",
			"<cmd>BufferLineCyclePrev<cr>",
		},
		{
			"<leader>bcl",
			"<cmd>BufferLineCloseLeft<cr>",
		},
		{
			"<leader>bcr",
			"<cmd>BufferLineCloseRight<cr>",
		},
		{
			"<leader>bco",
			"<cmd>BufferLineCloseOthers<cr>",
		},
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
