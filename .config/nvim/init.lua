-- 
-- File: init.lua
--
-- Author: Isotoxal
--

-- Easy functions
--
-- Keymap functions
function map (mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end
function nmap(shortcut, command)
  map('n', shortcut, command)
end
function imap(shortcut, command)
  map('i', shortcut, command)
end

-- Colemak Support
--
nmap('n', 'j')
nmap('e', 'k')
nmap('i', 'l')
nmap('l', 'u')
nmap('u', 'i')
nmap('f', 'e')

-- Settings
--
vim.cmd
([[
set list
set hidden
set nu rnu
set ttyfast
set showcmd
set ttimeout
set autoread
set wildmenu
set incsearch
set lazyredraw
set cursorline
set noswapfile
set splitbelow
set splitright
set autoindent
set ignorecase
set nocompatible
set ttimeoutlen=50
set listchars=tab:\|\ "Space needs to be here
set clipboard=unnamedplus
set wildmode=longest:full,full
set completeopt=longest,menuone,preview
set tabstop=4 shiftwidth=4 softtabstop=4
]])
vim.cmd("syntax on")

-- Themes
--
-- Colorscheme
vim.cmd('colorscheme catppuccin')
-- Lualine
require('lualine').setup {
  options = {
    theme = "catppuccin"
  }
}

-- Vimwiki Config
--
vim.cmd([[
let g:vimwiki_list = [{'path': '~/.vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
]])

-- Leader Keystuff
vim.g.mapleader = ' '
nmap('<leader>w', ":w<cr>")
nmap('<leader>wq', ":wq<cr>")
nmap('<leader>q', ":q<cr>")
nmap('<leader>qq', ":q!<cr>")
nmap('<leader>s', ":source ~/.config/nvim/init.lua")

-- Packages
--
return require('packer').startup(function()
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    -- Luasnip
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    
    -- Theme
    -- 
    -- Catppuccin
    use {'catppuccin/nvim', as='catppuccin'}
    -- Lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    -- Fuzzy Search
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'amirrezaask/fuzzy.nvim', requires={'nvim-lua/plenary.nvim'}}
    
    -- Auto Pairs
    use 'chun-yang/auto-pairs'

	-- Vimwiki
	use 'vimwiki/vimwiki'
end)
