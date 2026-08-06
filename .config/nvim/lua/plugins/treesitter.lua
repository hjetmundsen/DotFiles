local ts = require("nvim-treesitter")

local parsers = require("jet.languages").parsers()

ts.setup({})

--- Returns the configured parsers that are not yet installed on disk.
local function missing_parsers()
	local installed = {}
	for _, name in ipairs(ts.get_installed("parsers")) do
		installed[name] = true
	end

	local missing = {}
	for _, parser in ipairs(parsers) do
		if not installed[parser] then
			table.insert(missing, parser)
		end
	end
	return missing
end

vim.api.nvim_create_user_command("TSInstallConfigured", function()
	ts.install(parsers, { summary = true })
end, {
	desc = "Install configured treesitter parsers",
})

-- Adding a language to jet.languages is enough: anything missing installs on the
-- next start. ts.install is async, so this does not block startup. The FileType
-- autocmd in jet.init is guarded for buffers opened while an install is in flight.
local missing = missing_parsers()
if #missing > 0 then
	vim.notify(("Installing treesitter parsers: %s"):format(table.concat(missing, ", ")), vim.log.levels.INFO)
	ts.install(missing)
end
