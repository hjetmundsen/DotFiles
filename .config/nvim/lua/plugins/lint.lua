local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	python = { "ruff" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("Lint", {}),
	callback = function()
		lint.try_lint()
	end,
})
