require("trouble").setup({})

local map = vim.keymap.set
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
	{ desc = "Buffer Diagnostics (Trouble)" })
map("n", "]x", "<cmd>Trouble diagnostics next<cr>", { desc = "Next diagnostic (Trouble)" })
map("n", "[x", "<cmd>Trouble diagnostics prev<cr>", { desc = "Previous diagnostic (Trouble)" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" })
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
