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

-- nvim-cmp
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    })
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
  
  cmp.setup {
	  sources = {
		  {name = 'nvim_lua'}
	  }
  }

  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  require('lspconfig')['pyright'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['rls'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['gdscript'].setup {
    capabilities = capabilities
  }
  require('lspconfig')['bash'].setup {
    capabilities = capabilities
  }

-- Treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  hightlight = { enable = true },
  indent = { enable = true }
}
require"nvim-treesitter.configs".setup {
    ensure_installed = "maintained",
	highlight = {
		enable = true,
        additional_vim_regex_highlighting = true,
    },
    textobjects = {
        select = {
            enable = true
        }
    },
    rainbow = {enable = true, extended_mode = true, max_file_lines = 1000},
    context_commentstring = {enable = true, enable_autocmd = false},
	matchup = {enable = true},
    context = {enable = true, throttle = true},
    autotag = {
		enable = true,
        filetypes = {
			"c",
			"c++",
			"rust",
			"python",
			"gdscript",
        }
    }
}

-- Packages
--
return require('packer').startup(function()
    -- Packer
    use 'wbthomason/packer.nvim'

    -- Treesitter
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}

    -- Completion
	use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-git'
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
