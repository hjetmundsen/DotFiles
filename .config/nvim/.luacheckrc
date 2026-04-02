-- Luacheck configuration for Neovim config

-- Use LuaJIT standard globals (Neovim's runtime)
std = "luajit"

-- Neovim globals
globals = {
	"vim",
}

-- Maximum line length
max_line_length = 120

-- Allow unused self arguments in methods
self = false
