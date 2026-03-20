return {
	"echasnovski/mini.nvim",
	version = false,
	event = "VeryLazy",
	config = function()
		require("mini.pairs").setup({
			modes = { insert = true, command = true, terminal = false },
		})

		require("mini.icons").setup({
			file = {
				[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
				["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
			},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		})

		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end

		require("mini.bufremove").setup()

		require("mini.notify").setup()

		require("mini.indentscope").setup()

		require("mini.surround").setup()

		require("mini.ai").setup()
	end,
}
