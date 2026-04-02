require("neogit").setup({})

local map = vim.keymap.set
map("n", "<leader>gs", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gc", "<cmd>Neogit commit<cr>", { desc = "Neogit commit" })
