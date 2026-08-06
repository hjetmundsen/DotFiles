require("which-key").setup({
	spec = {
		{ "<leader>c", group = "Code" },
		{ "<leader>f", group = "Find" },
		{ "<leader>q", group = "Session" },
		{ "<leader>g", group = "Git" },
		{ "<leader>r", group = "Rovo Dev" },
		{ "<leader>t", group = "Tabs" },
		{ "<leader>to", group = "Tab close others" },
		{ "<leader>v", group = "LSP" },
		{ "<leader>vc", group = "LSP code" },
		{ "<leader>vr", group = "LSP refactor" },
		{ "<leader>x", group = "Diagnostics" },
		{ "gs", group = "Surround" },
		{ "<F5>", desc = "Debug: start/continue" },
	},
})
