return require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'

    use {
        'vim-airline/vim-airline',
        config = function ()
            require('plugins.airline')
        end
    }

    use {
        'tpope/vim-surround'
    }

    use {
        'easymotion/vim-easymotion',
        config = function ()
            require('plugins.easymotion')
        end
    }

    use {
        'voldikss/vim-floaterm',
        config = function ()
            require('plugins.floaterm')
        end
    }

    use {
        'majutsushi/tagbar',
        config = function ()
            require('plugins.tagbar')
        end
    }

    use {
        'terryma/vim-multiple-cursors'
    }

    use {
        'tpope/vim-fugitive',
    }

    use {
        'scrooloose/nerdcommenter',
        config = function ()
            require('plugins.nerdcommenter')
        end
    }

    use {
        'wakatime/vim-wakatime',
    }

    use {
        'ternjs/tern_for_vim',
    }

    use {
        'Vimjas/vim-python-pep8-indent'
    }

    use {
        't9md/vim-choosewin',
        config = function ()
            require('plugins.choosewin')
        end
    }

    use {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require('plugins.devicons')
        end
    }

    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('plugins.indentline')
        end
    }

    use {
        'wfxr/minimap.vim',
        run = ':!cargo install --locked code-minimap',
        config = function ()
            require('plugins.minimap')
        end
    }

    use {
        'folke/todo-comments.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function ()
            require('plugins.todo')
        end
    }

    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('plugins.autopairs')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function ()
            require('plugins.telescope')
        end
    }

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.bufferline')
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.tree')
        end
    }

    use {
        'folke/trouble.nvim',
        config = function ()
            require('plugins.trouble')
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('plugins.gitsigns')
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-refactor'
        },
        config = function ()
            require('plugins.treesitter')
        end
    }

    use {
        'tzachar/cmp-tabnine',
        run = './install.sh',
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'tzachar/cmp-tabnine',
            'onsails/lspkind-nvim',
        },
        config = function ()
            require('plugins.cmp')
        end
    }

    use {
        'RishabhRD/nvim-lsputils',
        requires = {
            'RishabhRD/popfix'
        }
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'kabouzeid/nvim-lspinstall',
            'folke/lsp-colors.nvim',
            'RishabhRD/nvim-lsputils',
            'folke/lua-dev.nvim'
        },
        config = function ()
            require('plugins.lsp')
        end
    }

    use {
        'folke/twilight.nvim',
        config = function ()
            require('plugins.twilight')
        end
    }
end)
