vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
        opt = true,
    }
    -- comment
    use {
        'terrortylor/nvim-comment',
        config = function()
            require('configs.comment')
        end,
    }
    -- Themes
    use 'folke/tokyonight.nvim'
    use 'vim-airline/vim-airline-themes'
    use 'vim-airline/vim-airline'
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup()
        end,
    }
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
        run = "make install_jsregexp",
    }
    use 'rafamadriz/friendly-snippets'
    -- telescope
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        keys = {
            {'n','<leader>ff'},
            {'n','<leader>ft'},
            {'n','<leader>fg'},
            {'n','<leader>gg'},
            {'n','<leader>fb'},
        },
        cmd = {
            'Bfind',
        },
        config = function()
            require('configs.telescope')
        end,
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-tree/nvim-web-devicons'
    -- use 'nvim-tree/nvim-tree.lua'
    use 'MunifTanjim/nui.nvim'
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        -- event = "BufEnter",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require('configs.neo-tree')
        end,
    }
    -- bufferline
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
    -- git
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    -- colorizer
    use { 'norcalli/nvim-colorizer.lua',
        opt = true,
        event = "BufEnter",
        ft = {"*.html","*.css","*.svg"},
        config = function()
            require('configs.colorizer')
        end,
    }
    -- nerdfonts
    use {
        'lambdalisue/nerdfont.vim',
        opt = true,
    }
    -- indent guide
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('configs.indent')
        end,
    }
    -- treesitter syntax highlighter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('configs.treesitter')
        end,
    }
    use {
        'dstein64/vim-startuptime',
        opt = true,
    }
    -- autopairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup{}
        end
    }
    use {
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        after = "nvim-web-devicons", -- keep this if you're using NvChad
        config = function()
            require("barbecue").setup()
        end,
    }
end)
