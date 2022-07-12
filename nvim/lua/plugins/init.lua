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

        use('tpope/vim-surround')
        use('ojroques/vim-oscyank')
        use('terryma/vim-multiple-cursors')
        use('wakatime/vim-wakatime')
        use('Vimjas/vim-python-pep8-indent')
        use('ternjs/tern_for_vim')
        use('andymass/vim-matchup') -- extend % key
        use('tpope/vim-fugitive')
        use('folke/which-key.nvim')

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
            'phaazon/hop.nvim',
            as = 'hop',
            commit = 'cea96423874dd36a84a59b71796c43568202531a',
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
            'numToStr/Comment.nvim',
            config = function()
                require('plugins.comment')
            end,
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
                'RRethy/nvim-treesitter-endwise',
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
            'junnplus/nvim-lsp-setup',
            -- '~/Documents/workspace/nvim-lsp-setup',
            requires = {
                'neovim/nvim-lspconfig',
                'williamboman/nvim-lsp-installer',
                'hrsh7th/cmp-nvim-lsp',
                'folke/lsp-colors.nvim',
                'folke/lua-dev.nvim',
                'ray-x/lsp_signature.nvim',
                'jose-elias-alvarez/null-ls.nvim',
                'simrat39/rust-tools.nvim',
                'p00f/clangd_extensions.nvim',
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
            'j-hui/fidget.nvim', -- nvim-lsp progress
            config = function()
                require('plugins.fidget')
            end,
        })

        use({
            'kevinhwang91/nvim-ufo',
            requires = 'kevinhwang91/promise-async',
            config = function()
                require('plugins.ufo')
            end,
        })

        use('whiteinge/diffconflicts')
    end,
})

local packer_group = vim.api.nvim_create_augroup('packer_group', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = '*/lua/*.lua',
    callback = function()
        vim.cmd('source <afile>')
        vim.cmd('PackerCompile')
    end,
    group = packer_group,
})
