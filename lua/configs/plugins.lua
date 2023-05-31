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
    -- Dashboard
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        event = "VimEnter",
        config = function ()
         local alpha = require'alpha'
         local dashboard = require'alpha.themes.dashboard'
         dashboard.section.buttons.val = {
            dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
            -- dashboard.button("SPC f f", "󰈞  Find file"),
            -- dashboard.button("SPC f h", "󰊄  Recently opened files"),
            -- dashboard.button("SPC f r", "  Frecency/MRU"),
            -- dashboard.button("SPC f g (X)", "󰈬  Find word","<CR>"),
            -- dashboard.button("SPC f m", "  Jump to bookmarks"),
            -- dashboard.button("SPC s l", "  Open last session"),
            dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
         }
         alpha.setup(dashboard.config)
        end,
    }
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
        event = "VimEnter",
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
    use 'lukas-reineke/indent-blankline.nvim'
    -- treesitter syntax highlighter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        'dstein64/vim-startuptime',
        opt = true,
    }
    -- autopairs
    use {
        "windwp/nvim-autopairs",
        event = 'VimEnter',
        config = function()
            require("nvim-autopairs").setup{}
        end
    }
end)
