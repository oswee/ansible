local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'                                        -- Easily install LSP language servers
  use 'hrsh7th/nvim-compe'
  use 'glepnir/lspsaga.nvim'
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'                                         -- Show function signature as you type
  use 'simrat39/symbols-outline.nvim'
  use 'folke/lsp-colors.nvim'                                            -- Create missing LSP diagnostics highlight groups for color schemes that don't yet support the Neovim 0.5 builtin LSP client
  use 'sirver/ultisnips'

  -- use {
  --   'gruvbox-community/gruvbox',
  -- }
  use {
    'ellisonleao/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'},
  }
  use 'mhinz/vim-startify'
  use {
    'preservim/nerdtree',
    requires = {'ryanoasis/vim-devicons'},
  }
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   requires = 'kyazdani42/nvim-web-devicons',
  --   config = function() require'nvim-tree'.setup {} end
  -- }
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    }
  }
  use {
    'pwntester/octo.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope.nvim'},
      {'kyazdani42/nvim-web-devicons'}
    }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use ('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
  use 'folke/which-key.nvim'
  use 'Yggdroot/indentLine'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'airblade/vim-rooter'
  use 'editorconfig/editorconfig-vim'
  use 'tpope/vim-commentary'
  use 'vimwiki/vimwiki'
  use 'lepture/vim-jinja'
  use 'bufbuild/vim-buf'
  use 'pearofducks/ansible-vim'
  -- use 'dense-analysis/ale'
  use 'mbbill/undotree'
  use 'stephpy/vim-php-cs-fixer'

end)
