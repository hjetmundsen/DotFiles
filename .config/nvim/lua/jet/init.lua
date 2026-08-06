require("jet.set")
require("jet.remap")

local augroup = vim.api.nvim_create_augroup
local JetGroup = augroup("Jet", {})

local autocmd = vim.api.nvim_create_autocmd

vim.filetype.add({
	extension = {
		templ = "templ",
	},
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
		-- Neovim 0.11+ already provides grn/gra/grr/gri/grt/gO/K and ]d/[d by
		-- default; gd (definition) is the notable omission.
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts("Go to definition"))
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts("Workspace symbol"))
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts("Open diagnostic float"))
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts("Code action"))
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts("Rename symbol"))
		-- <C-k> in both modes: not <C-h> (Backspace, :h i_CTRL-H) and not <C-s>
		-- (XOFF in most terminals). Shadows digraph insertion, :h i_CTRL-K.
		-- Quickfix nav was moved to ]q/[q to free this key.
		vim.keymap.set({ "n", "i" }, "<C-k>", function()
			vim.lsp.buf.signature_help()
		end, opts("Signature help"))
	end,
})

-- Guarded: a filetype whose parser is not installed yet (e.g. just added to
-- jet.languages, install still running) would otherwise throw on every buffer.
autocmd("FileType", {
	group = JetGroup,
	pattern = require("jet.languages").filetypes(),
	callback = function()
		if not pcall(vim.treesitter.start) then
			return
		end
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
})

-- Loaded last so that a failing plugin config cannot prevent the autocmds above
-- from being registered.
require("jet.pack")
