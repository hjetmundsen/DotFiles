vim.g.sonokai_style = "shusia"
-- Handled by the colorscheme rather than manual Normal/NormalFloat overrides: it
-- covers every group (signcolumn, borders, ...) and survives a colorscheme reload.
vim.g.sonokai_transparent_background = 1
-- "blend" (not the default "dim") so floats inherit the transparent Normal
-- background, and FloatBorder loses its opaque backdrop along with it.
vim.g.sonokai_float_style = "blend"
vim.cmd.colorscheme("sonokai")
