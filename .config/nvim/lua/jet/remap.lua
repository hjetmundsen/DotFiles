-- you cant tell me what i can and cant do
vim.keymap.set("n", ";", ":", { noremap = true, desc = "Command mode" })
vim.keymap.set("n", ":", ";", { noremap = true, desc = "Repeat f/t motion" })

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- maintain cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (cursor stays)" })

-- center view vertically after scrolling up or down half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up (centered)" })

-- center view vertically and unfold code when moving between search results
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- restart lsp
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabc<cr>", { desc = "Close tab" })

-- replace text with unnamed register without modifying contents of unnamed register
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })

-- send deleted text to black hole
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to black hole" })

-- disable Ex mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- format buffer
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer" })

-- navigate quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix item" })

-- navigate location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev location item" })

-- find and replace word under cursor in entire file
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Find and replace word under cursor" }
)

-- make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- open neovim config
vim.keymap.set("n", "<leader>vpp", "<cmd>e " .. vim.fn.stdpath("config") .. "/lua/jet/pack.lua<CR>", { desc = "Open Neovim config" })

-- oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
