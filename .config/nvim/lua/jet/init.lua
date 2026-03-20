require("jet.set")
require("jet.remap")
require("jet.lazy")

local augroup = vim.api.nvim_create_augroup
local JetGroup = augroup("Jet", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

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
			timeout = 200,
		})
	end,
})

autocmd("BufWritePre", {
	group = JetGroup,
	pattern = "*",
	callback = function()
		local ok, conform = pcall(require, "conform")
		if ok and #conform.list_formatters(0) > 0 then
			return
		end
		local save = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(save)
	end,
})

autocmd("LspAttach", {
	group = JetGroup,
	callback = function(e)
		local opts = function(desc)
			return { buffer = e.buf, desc = desc }
		end
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts("Go to definition"))
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts("Hover documentation"))
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts("Workspace symbol"))
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts("Open diagnostic float"))
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts("Code action"))
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts("Find references"))
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts("Rename symbol"))
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts("Signature help"))
	end,
})

autocmd("FileType", {
	group = JetGroup,
	pattern = require("jet.languages").filetypes(),
	callback = function()
		vim.treesitter.start()
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
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
