require("undotree").setup({})

vim.keymap.set("n", "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", { desc = "Toggle undo tree" })
