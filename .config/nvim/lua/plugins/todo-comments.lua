local todo = require("todo-comments")

todo.setup({})

local map = vim.keymap.set
map("n", "]t", todo.jump_next, { desc = "Next todo comment" })
map("n", "[t", todo.jump_prev, { desc = "Prev todo comment" })
map("n", "<leader>ft", "<cmd>TodoFzfLua<cr>", { desc = "Todo comments" })
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "Todo comments (Trouble)" })
