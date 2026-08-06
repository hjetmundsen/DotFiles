vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
-- 'undodir' left at its default (stdpath("state") .. "/undo")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Case-insensitive unless the pattern contains an uppercase char. The <leader>s
-- replace mapping passes the \I flag, so it stays case-sensitive regardless.
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Live preview of :s/:g results in a scratch split.
vim.opt.inccommand = "split"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200

vim.opt.foldenable = true
vim.opt.foldlevel = 99

-- Default border for floats that do not set their own (LSP hover, diagnostics,
-- vim.ui.*). blink.cmp inherits this too, so its menu border is pinned in
-- plugins/blink.lua to keep the completion popup borderless.
vim.opt.winborder = "rounded"

-- auto-session: 'localoptions' keeps filetype/highlighting correct after a session
-- restore; the plugin warns when it is missing (:checkhealth autosession).
vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Disable netrw (using oil.nvim as file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
