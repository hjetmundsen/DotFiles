-- Shared language configuration for treesitter and filetypes.
-- Maps Vim filetypes to their treesitter parser names.
-- Add new languages here to enable both treesitter install and highlighting.

local M = {}

-- Each entry maps a Vim filetype to its treesitter parser name.
-- When they are the same, the parser value matches the key.
M.filetype_to_parser = {
	bash = "bash",
	css = "css",
	dockerfile = "dockerfile",
	git_config = "git_config",
	elixir = "elixir",
	git_rebase = "git_rebase",
	gitcommit = "gitcommit",
	gitignore = "gitignore",
	go = "go",
	heex = "heex",
	html = "html",
	java = "java",
	javascript = "javascript",
	javascriptreact = "javascript",
	json = "json",
	kotlin = "kotlin",
	lua = "lua",
	make = "make",
	markdown = "markdown",
	python = "python",
	rust = "rust",
	sql = "sql",
	terraform = "terraform",
	toml = "toml",
	typescript = "typescript",
	typescriptreact = "tsx",
	yaml = "yaml",
}

--- Returns a list of Vim filetypes (for use in autocmd patterns).
function M.filetypes()
	local fts = {}
	for ft, _ in pairs(M.filetype_to_parser) do
		table.insert(fts, ft)
	end
	table.sort(fts)
	return fts
end

--- Returns a deduplicated list of treesitter parser names (for use in ts.install).
function M.parsers()
	local seen = {}
	local parsers = {}
	for _, parser in pairs(M.filetype_to_parser) do
		if not seen[parser] then
			seen[parser] = true
			table.insert(parsers, parser)
		end
	end
	table.sort(parsers)
	return parsers
end

return M
