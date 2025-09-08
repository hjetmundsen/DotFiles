return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    {
      "<leader>pf",
      function() Snacks.picker.files() end,
      desc = "Search all files"
    },
    {
      "<leader>pg",
      function() Snacks.picker.git_files() end,
      desc = "Search all files tracked by git"
    },
    {
      "<leader>ps",
      function() Snacks.picker.grep() end,
      desc = "Search content of all files tracked by git"
    },
    {
      "<leader>pr",
      function() Snacks.picker.lsp_references() end,
      desc = "Search all references to syntax under cursor"
    },
    {
      "<leader>pv",
      function() Snacks.explorer() end,
      desc = "Open file explorer"
    },
    {
      "<leader>bb",
      function() Snacks.picker.buffers() end,
      desc = "Search all open buffers"
    },
    {
      "<leader>bd",
      function() Snacks.bufdelete() end,
      desc = "Delete active buffer"
    },
    {
      "<leader>gg",
      function() Snacks.lazygit() end,
      desc = "Open Lazygit in floating window"
    },
  }
}
