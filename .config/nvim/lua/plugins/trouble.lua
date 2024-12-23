return {
    {
        "folke/trouble.nvim",
        keys = {
            {
                "<leader>tt",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)"
            },
            {
                "[t",
                "<cmd>Trouble diagnostics next<cr>"
            },
            {
                "]t",
                "<cmd>Trouble diagnostics prev<cr>"
            }
        },
        opts = {}
    }
}
