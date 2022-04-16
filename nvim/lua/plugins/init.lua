local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim/plugin/packer.lua'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
end

require('packer').startup({
    config = {
        compile_path = compile_path,
    },
    function(use)
        use('wbthomason/packer.nvim')
        -- use('tjdevries/colorbuddy.nvim')
        -- use('Pocco81/Catppuccino.nvim')

        use({
            'folke/tokyonight.nvim',
            config = function()
                require('plugins.tokyonight')
            end,
        })

        use({
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function()
                require('plugins.line')
            end,
        })

        use({
            'tpope/vim-surround',
        })

        use({
            'phaazon/hop.nvim',
            as = 'hop',
            config = function()
                require('plugins.hop')
            end,
        })

        use({
            'majutsushi/tagbar',
            config = function()
                require('plugins.tagbar')
            end,
        })

        use({
            'terryma/vim-multiple-cursors',
        })

        use({
            'scrooloose/nerdcommenter',
            config = function()
                require('plugins.nerdcommenter')
            end,
        })

        use({
            'numToStr/Comment.nvim',
            config = function()
                require('Comment').setup()
            end,
        })

        use({
            'wakatime/vim-wakatime',
        })

        -- use({
        --     'ternjs/tern_for_vim',
        -- })

        use({
            'Vimjas/vim-python-pep8-indent',
        })

        use({
            't9md/vim-choosewin',
            config = function()
                require('plugins.choosewin')
            end,
        })

        use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('plugins.devicons')
            end,
        })

        use({
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('plugins.indentline')
            end,
        })

        use({
            'andymass/vim-matchup', -- extend % key
        })

        use({
            'windwp/nvim-autopairs',
            config = function()
                require('plugins.autopairs')
            end,
        })

        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope-github.nvim',
                'nvim-telescope/telescope-packer.nvim',
            },
            config = function()
                require('plugins.telescope')
            end,
        })

        use({
            'akinsho/bufferline.nvim',
            requires = 'kyazdani42/nvim-web-devicons',
            config = function()
                require('plugins.bufferline')
            end,
        })

        use({
            'kyazdani42/nvim-tree.lua',
            requires = 'kyazdani42/nvim-web-devicons',
            commit = 'ba121f0244a3bd16919ba75c5ea12806a0538bd3',
            config = function()
                require('plugins.tree')
            end,
        })

        use({
            'tpope/vim-fugitive',
        })

        use({
            'lewis6991/gitsigns.nvim',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('plugins.gitsigns')
            end,
        })

        use({
            'github/copilot.vim',
            setup = function()
                vim.g.copilot_no_tab_map = 1
                vim.g.copilot_no_maps = 1
                vim.g.copilot_assume_mapped = 1
            end,
            config = function()
                local map = require('utils').map
                map('i', '<C-e>', 'copilot#Accept()', { expr = true })
            end,
        })

        use({
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            requires = {
                'nvim-treesitter/playground',
                'nvim-treesitter/nvim-treesitter-refactor',
                'nvim-treesitter/nvim-treesitter-textobjects',
            },
            config = function()
                require('plugins.treesitter')
            end,
        })

        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-vsnip',
                'hrsh7th/vim-vsnip',
                'hrsh7th/vim-vsnip-integ',
                'hrsh7th/cmp-buffer',
                'onsails/lspkind-nvim',
            },
            config = function()
                require('plugins.cmp')
            end,
        })

        use({
            'neovim/nvim-lspconfig',
            requires = {
                'williamboman/nvim-lsp-installer',
                'folke/lsp-colors.nvim',
                'folke/lua-dev.nvim',
                'ray-x/lsp_signature.nvim',
                'jose-elias-alvarez/null-ls.nvim',
                'hrsh7th/cmp-nvim-lsp',
            },
            config = function()
                require('plugins.lsp')
            end,
        })

        use({
            'akinsho/toggleterm.nvim',
            config = function()
                require('plugins.toggleterm')
            end,
        })

        use({
            'folke/which-key.nvim',
        })

        use({
            'j-hui/fidget.nvim', -- nvim-lsp progress
            config = function()
                require('plugins.fidget')
            end,
        })
    end,
})
