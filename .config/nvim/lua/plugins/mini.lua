require("mini.pairs").setup({
	modes = { insert = true, command = true, terminal = false },
})

require("mini.icons").setup({
	file = {
		[".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
		["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
	},
	filetype = {
		dotenv = { glyph = "", hl = "MiniIconsYellow" },
	},
})

-- Serve mini.icons to anything that require()s nvim-web-devicons. Registered as a
-- preload hook rather than calling mock_nvim_web_devicons() directly because
-- bufferline and lualine load before this file (plugins/*.lua load alphabetically);
-- the hook fires whenever they first ask for it, so load order does not matter.
package.preload["nvim-web-devicons"] = function()
	require("mini.icons").mock_nvim_web_devicons()
	return package.loaded["nvim-web-devicons"]
end

require("mini.indentscope").setup()

-- The indent guide is noise in plugin/preview buffers, which have no meaningful
-- indent structure to trace.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("MiniIndentscopeDisable", {}),
	pattern = {
		"help",
		"markdown",
		"oil",
		"trouble",
		"lazy",
		"mason",
		"fzf",
		"grug-far",
		"undotree",
		"diff",
		"NeogitStatus",
		"dap-repl",
		"dapui_scopes",
		"dapui_stacks",
		"dapui_watches",
		"dapui_breakpoints",
		"dapui_console",
	},
	callback = function()
		vim.b.miniindentscope_disable = true
	end,
})

require("mini.splitjoin").setup()

-- Moved off the default `s` prefix: flash.nvim owns `s`, and having both makes
-- every plain `s` wait out 'timeoutlen' to see if `sa`/`sd`/`sr` follows.
require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})
local ai = require("mini.ai")
ai.setup({
	custom_textobjects = {
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		o = ai.gen_spec.treesitter({
			a = { "@conditional.outer", "@loop.outer" },
			i = { "@conditional.inner", "@loop.inner" },
		}),
		a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }),
	},
})
