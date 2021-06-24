return require('packer').startup(function() 

  -- Packer can manage itself as an optional plugin
  use { 'wbthomason/packer.nvim', opt = true }

  -- Color scheme
  use { 'phanviet/vim-monokai-pro' }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- LSP and completion
  use { 'neovim/nvim-lspconfig' }
  use { 'nvim-lua/completion-nvim' }

  -- Lua development
  use { 'tjdevries/nlua.nvim' }

  -- Git
  use { 'tpope/vim-fugitive' }
  use { 'airblade/vim-gitgutter' }

  -- Tagbar
  use { 'majutsushi/tagbar' }

  -- Quality of Life
  use { 'easymotion/vim-easymotion' }
  use { 'jiangmiao/auto-pairs' }
  use { 'preservim/nerdtree' }
  use { 'scrooloose/nerdcommenter' }
  use { 'tpope/vim-surround' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

end)
