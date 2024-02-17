local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    {
        'sainnhe/sonokai',
        config = function()
            vim.g.sonokai_style = 'shusia'
            vim.cmd.colorscheme('sonokai')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'kyazdani42/nvim-web-devicons' } }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { 'nvim-treesitter/playground' },
    {
        'nvim-neorg/neorg',
        build = ':Neorg sync-parsers',
        opts = {
            load = {
                ['core.defaults'] = {}, -- Loads default behaviour
                ['core.concealer'] = {}, -- Adds pretty icons to your documents
                ['core.dirman'] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = '~/Documents/Notes',
                        },
                    },
                },
            },
        },
        dependencies = { { 'nvim-lua/plenary.nvim' } },
    },
    { 'theprimeagen/harpoon' },
    { 'mbbill/undotree' },
    { 'tpope/vim-fugitive' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },
    { 'windwp/nvim-autopairs' },
    {
        'ggandor/leap.nvim',
        dependencies = { { 'tpope/vim-repeat' } }
    },
    {
    'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    { 'airblade/vim-gitgutter' }
})
