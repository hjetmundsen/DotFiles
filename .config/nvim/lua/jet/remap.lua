-- you cant tell me what i can and cant do
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true })
vim.api.nvim_set_keymap("n", ":", ";", { noremap = true })

-- move lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- maintain cursor position when joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- center view vertically after scrolling up or down half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center view veritcally and unfold code when moving between search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- restart lsp
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- tabs
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<cr>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<cr>")
vim.keymap.set("n", "<leader>tc", "<cmd>tabc<cr>")

-- replace text with unnamed register without modifying contents of unnamed register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- send deleted text to black hole
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- disable Ex mode
vim.keymap.set("n", "Q", "<nop>")

-- format buffer
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigate quickfix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- navigate location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- find and replace word under cursor in entire file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make the current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open neovim config
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/jet/lazy.lua<CR>")
