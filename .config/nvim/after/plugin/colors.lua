function ColorMyPencils(color)
	color = color or "gruvbox-material"

    vim.g.gruvbox_material_background = "medium"
	vim.cmd.colorscheme(color)
    vim.opt.background = "dark"

    vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

ColorMyPencils()
