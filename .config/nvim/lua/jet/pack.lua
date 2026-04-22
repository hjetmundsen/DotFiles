-- Plugin manager: vim.pack (Neovim 0.12+ built-in)
-- Plugins are declared here; configuration lives in lua/plugins/*.lua

local gh = function(x)
	return "https://github.com/" .. x
end

-------------------------------------------------------------------------------
-- Build hooks (PackChanged autocmd)
-------------------------------------------------------------------------------
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		-- treesitter: run :TSUpdate after install/update
		if name == "nvim-treesitter" then
			vim.cmd("TSUpdate")
		end
	end,
})

-------------------------------------------------------------------------------
-- Install plugins via vim.pack
-------------------------------------------------------------------------------
vim.pack.add({
	-- Colorscheme
	gh("sainnhe/sonokai"),

	-- File explorer
	gh("stevearc/oil.nvim"),

	-- Fuzzy finder
	gh("ibhagwan/fzf-lua"),

	-- Navigation
	gh("folke/flash.nvim"),
	{ src = gh("ThePrimeagen/harpoon"), branch = "harpoon2" },

	-- Treesitter
	gh("nvim-treesitter/nvim-treesitter"),

	-- LSP
	gh("neovim/nvim-lspconfig"),
	gh("williamboman/mason.nvim"),
	gh("williamboman/mason-lspconfig.nvim"),
	gh("j-hui/fidget.nvim"),

	-- Completion
	{ src = gh("saghen/blink.cmp"), version = vim.version.range("1.0") },
	gh("rafamadriz/friendly-snippets"),

	-- Formatting & Linting
	gh("stevearc/conform.nvim"),
	gh("mfussenegger/nvim-lint"),

	-- Git
	gh("lewis6991/gitsigns.nvim"),
	gh("NeogitOrg/neogit"),
	gh("nvim-lua/plenary.nvim"),
	gh("sindrets/diffview.nvim"),

	-- UI
	gh("nvim-lualine/lualine.nvim"),
	gh("akinsho/bufferline.nvim"),
	gh("echasnovski/mini.nvim"),
	gh("folke/which-key.nvim"),
	gh("folke/trouble.nvim"),
	gh("folke/todo-comments.nvim"),
	gh("MeanderingProgrammer/render-markdown.nvim"),

	-- Utilities
	gh("rmagatti/auto-session"),
	gh("MagicDuck/grug-far.nvim"),
	gh("mbbill/undotree"),
	gh("folke/lazydev.nvim"),
})

-------------------------------------------------------------------------------
-- Local plugins (not managed by vim.pack)
-------------------------------------------------------------------------------
vim.opt.rtp:prepend(vim.fn.expand("~/Repos/rovo-dev.nvim/main"))

-------------------------------------------------------------------------------
-- Load plugin configurations from lua/plugins/*.lua
-------------------------------------------------------------------------------
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local files = vim.fn.glob(plugins_dir .. "/*.lua", false, true)
table.sort(files)

for _, file in ipairs(files) do
	local name = vim.fn.fnamemodify(file, ":t:r")
	require("plugins." .. name)
end
