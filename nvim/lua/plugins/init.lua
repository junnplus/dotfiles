local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local compile_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim/plugin/packer.lua'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd('packadd packer.nvim')
end

vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'Packer',
    pattern = '*/lua/*.lua',
    callback = function()
        vim.cmd('source <afile>')
        vim.cmd('PackerCompile')
    end,
})

require('packer').startup({
    config = {
        compile_path = compile_path,
    },
    function(use)
        use('wbthomason/packer.nvim')

        use('terryma/vim-multiple-cursors')
        use('wakatime/vim-wakatime')
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
            config = function()
                require('plugins.hop')
            end,
        })

        use({
            'numToStr/Comment.nvim',
            config = function()
                require('plugins.comment')
            end,
        })

        use({
            'tkmpypy/chowcho.nvim',
            config = function()
                require('plugins.chowcho')
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
                'nvim-treesitter/nvim-treesitter-context',
                'RRethy/nvim-treesitter-endwise',
                'andymass/vim-matchup', -- extend % key
                'yioneko/nvim-yati',
                'm-demare/hlargs.nvim',
            },
            config = function()
                require('plugins.hlargs')
                require('plugins.treesitter')
            end,
        })

        use({
            'hrsh7th/nvim-cmp',
            requires = {
                'hrsh7th/cmp-vsnip',
                'hrsh7th/cmp-nvim-lsp',
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
            'junnplus/lsp-setup.nvim',
            -- '~/Documents/workspace/nvim-lsp-setup',
            requires = {
                'neovim/nvim-lspconfig',
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
                'folke/lsp-colors.nvim',
                'folke/lua-dev.nvim',
                'ray-x/lsp_signature.nvim',
                'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
                -- 'simrat39/rust-tools.nvim',
                -- 'p00f/clangd_extensions.nvim',
                -- 'lukas-reineke/lsp-format.nvim',
                -- 'lvimuser/lsp-inlayhints.nvim',
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

        -- use({
        --     'ojroques/nvim-osc52',
        --     config = function()
        --         require('plugins.osc52')
        --     end
        -- })

        use({
            'AckslD/nvim-FeMaco.lua',
            config = function()
                require('plugins.femaco')
            end,
        })

        use({
            'krivahtoo/silicon.nvim',
            run = './install.sh build',
            branch = 'main',
            config = function()
                require('plugins.silicon')
            end
        })

        use({
            'gaoDean/autolist.nvim',
            config = function()
                require('plugins.autolist')
            end,
        })

        use({ 'gen740/SmoothCursor.nvim',
            config = function()
                require('plugins.smoothcursor')
            end
        })
    end,
})
