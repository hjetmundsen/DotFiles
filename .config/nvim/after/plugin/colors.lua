function ColorMyPencils(color, style)
    color = color or "sonokai"

    if (color == "sonokai")
    then
        style = style or "default"
        vim.g.sonokai_style = style
    end

	vim.cmd.colorscheme(color)
end

ColorMyPencils()
