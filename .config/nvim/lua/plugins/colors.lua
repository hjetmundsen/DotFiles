function ColorMyPencils(color, style)
    color = color or "sonokai"

    if (color == "sonokai")
    then
        style = style or "shusia"
        vim.g.sonokai_style = style
    end

	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    'sainnhe/sonokai',
    config = function()
        ColorMyPencils('sonokai', 'shusia')
    end
}
