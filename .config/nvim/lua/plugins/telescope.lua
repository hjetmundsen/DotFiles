return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>pf",
            "<cmd>Telescope find_files<cr>",
            desc = "Search all files in the root directory"
        },
        {
            "<C-p>",
            "<cmd>Telescope git_files<cr>",
            desc = "Search all files in the root directory tracked by git"
        },
        {
            "<leader>ps",
            "<cmd>Telescope live_grep<cr>",
            desc = "Search all files tracked by git for a string"
        },
        {
            "<leader>vh",
            "<cmd>Telescope help_tags<cr>"
        },
        {
            "<leader>bb",
            "<cmd>Telescope buffers<cr>",
            desc = "Search all open buffers"
        },
        {
            "<leader>bc",
            "<cmd>Telescope git_bcommits<cr>"
        }
    },
    opts = {}
}
