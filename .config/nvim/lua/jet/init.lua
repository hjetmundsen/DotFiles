require("jet.set")
require("jet.remap")
require("jet.lazy")

local augroup = vim.api.nvim_create_augroup
local JetGroup = augroup("Jet", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

-- function R(name)
-- 	require("plenary.reload").reload_module(name)
-- end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

autocmd("BufWritePre", {
	group = JetGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd({ "BufReadPost", "FileReadPost" }, {
	group = JetGroup,
	pattern = "*",
	command = "normal! zR",
})

autocmd("LspAttach", {
	group = JetGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

autocmd("FileType", {
	group = JetGroup,
	pattern = {
		"bash",
		"css",
		"dockerfile",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"go",
		"html",
		"java",
		"javascript",
		"json",
		"jsx",
		"kotlin",
		"lua",
		"make",
		"markdown",
		"python",
		"rust",
		"sql",
		"terraform",
		"toml",
		"typescript",
		"typescriptreact",
		"yaml",
	},
	callback = function()
		vim.treesitter.start()
		vim.treesitter.foldexpr()
	end,
})

-- Function to show/hide bufferline depending on number of tabs
local function update_bufferline_visibility()
	local tab_count = vim.fn.tabpagenr("$")
	if tab_count > 1 then
		vim.o.showtabline = 2 -- always show
	else
		vim.o.showtabline = 0 -- never show
	end
end

-- Set up autocommands to check on tab changes
autocmd({ "TabNew", "TabClosed", "TabEnter", "TabLeave" }, {
	group = JetGroup,
	callback = update_bufferline_visibility,
})

update_bufferline_visibility()

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
