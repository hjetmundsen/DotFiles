return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.icons" },
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
