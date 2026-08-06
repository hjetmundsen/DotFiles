local dap = require("dap")
local dapui = require("dapui")

dapui.setup({})

-- Go: nvim-dap-go wires up the delve adapter and Go launch configs.
require("dap-go").setup()

-- Python: point at Mason's debugpy venv when present, otherwise fall back to
-- whatever python3 is on PATH. Resolved by path rather than via mason-registry
-- because plugins/dap.lua loads before plugins/lsp.lua calls mason.setup().
local debugpy = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
require("dap-python").setup(vim.uv.fs_stat(debugpy) and debugpy or "python3")

-- Open/close the UI with the session rather than managing it by hand.
dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end

vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DiagnosticInfo", linehl = "Visual" })

-- Stepping is on the F-keys (VS Code convention). <leader>d is already taken by
-- the black-hole delete operator, so breakpoints live on <leader>b instead --
-- which also means nothing may be bound under <leader>b.
local map = vim.keymap.set
map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
map("n", "<leader>B", function()
	vim.ui.input({ prompt = "Breakpoint condition: " }, function(cond)
		if cond and cond ~= "" then
			dap.set_breakpoint(cond)
		end
	end)
end, { desc = "Conditional breakpoint" })

map("n", "<F5>", dap.continue, { desc = "Debug: start/continue" })
map("n", "<F6>", dap.terminate, { desc = "Debug: terminate" })
map("n", "<F7>", dapui.toggle, { desc = "Debug: toggle UI" })
map("n", "<F10>", dap.step_over, { desc = "Debug: step over" })
map("n", "<F11>", dap.step_into, { desc = "Debug: step into" })
map("n", "<F12>", dap.step_out, { desc = "Debug: step out" })

map({ "n", "v" }, "<leader>e", function()
	dapui.eval(nil, { enter = true })
end, { desc = "Debug: evaluate expression" })
