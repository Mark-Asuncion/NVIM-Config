vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- comment
    use 'terrortylor/nvim-comment'
    -- Themes
    use 'folke/tokyonight.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim' 
    -- auto-completion
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    -- LuaSnip
    use{
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    }
    use 'rafamadriz/friendly-snippets'
    -- telescope
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- nvim tree
    use 'nvim-tree/nvim-web-devicons'
    -- use 'nvim-tree/nvim-tree.lua'
    use 'MunifTanjim/nui.nvim'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
    }
    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    -- git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    -- colorizer
    use { 'norcalli/nvim-colorizer.lua',
        -- ft = {"*.html","*.css","*.svg"},
    }
    -- nerdfonts
    use 'lambdalisue/nerdfont.vim'
    -- indent guide
    use 'lukas-reineke/indent-blankline.nvim'
    -- treesitter syntax highlighter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
end)
