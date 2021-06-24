local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'laststatus', 2)

cmd 'set noruler'
cmd 'set noshowcmd'
cmd [[
augroup cmdline
  autocmd CmdlineLeave : echo ''
augroup END
]]
