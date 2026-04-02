require("which-key").setup({
	spec = {
		{ "<leader>b", group = "Buffer" },
		{ "<leader>bc", group = "Buffer close" },
		{ "<leader>c", group = "Code" },
		{ "<leader>d", group = "Delete (black hole)" },
		{ "<leader>f", group = "Find" },
		{ "<leader>q", group = "Session" },
		{ "<leader>g", group = "Git" },
		{ "<leader>r", group = "Rovo Dev" },
		{ "<leader>t", group = "Tabs" },
		{ "<leader>v", group = "LSP" },
		{ "<leader>vc", group = "LSP code" },
		{ "<leader>vr", group = "LSP refactor" },
		{ "<leader>x", group = "Diagnostics" },
		{ "<leader>y", group = "Yank (clipboard)" },
	},
})
