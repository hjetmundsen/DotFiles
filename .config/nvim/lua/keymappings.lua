local utils = require('utils')

-- Swap colon and semicolon
utils.map('n', ';', ':')
utils.map('n', ':', ';')

-- Tagbar
utils.map('n', '<Leader>t', '<cmd>TagbarOpenAutoClose<CR>')

-- NERDTree
utils.map('n', '<Leader>n', '<cmd>NERDTreeToggle<CR>')

-- Telescope
utils.map('n', '<Leader>pf', '<cmd>Telescope find_files<CR>')
utils.map('n', '<Leader>pg', '<cmd>Telescope git_files<CR>')
utils.map('n', '<Leader>pt', '<cmd>Telescope tags<CR>')
utils.map('n', '<Leader>pr', '<cmd>Telescope live_grep<CR>')

-- Buffers
utils.map('n', '<Leader>bb', '<cmd>Telescope buffers<CR>')
utils.map('n', '<Leader>bn', '<cmd>bnext<CR>')
utils.map('n', '<Leader>bp', '<cmd>bprevious<CR>')

-- Fugitive
utils.map('n', '<Leader>gg', '<cmd>G<CR>')
