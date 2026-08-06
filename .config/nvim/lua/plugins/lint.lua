local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	python = { "ruff" },
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
}

-- golangci-lint uses a runner lock. nvim-lint can trigger multiple runs close
-- together, so serialize overlapping Go lint runs instead of surfacing lock
-- acquisition failures as non-diagnostic editor warnings.
local golangcilint = lint.linters.golangcilint
if golangcilint and type(golangcilint.args) == "table" then
	table.insert(golangcilint.args, 2, "--allow-serial-runners")
end

-- BufReadPost rather than BufEnter: linting on open is the point, but BufEnter
-- would re-lint on every window/split switch too.
vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("Lint", {}),
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end

		lint.try_lint()
	end,
})
