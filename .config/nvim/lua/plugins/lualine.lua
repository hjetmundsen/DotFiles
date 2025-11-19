return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						"filename",
						path = 0,
					},
				},
				lualine_x = { "filetype" },
			},
			inactive_sections = {
				lualine_c = {
					{
						"filename",
						path = 0,
					},
				},
			},
		})
	end,
}
