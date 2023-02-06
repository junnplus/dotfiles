local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "tpope/vim-fugitive",
    "terryma/vim-multiple-cursors",
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
            require("plugins.tokyonight")
        end,
    },
    {
        "wakatime/vim-wakatime",
        event = "InsertEnter",
    },
    {
        "folke/which-key.nvim",
        lazy = true
    },
    {
        'hoob3rt/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('plugins.line')
        end,
    },
    {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('plugins.devicons')
        end,
    },
    {
        'phaazon/hop.nvim',
        keys = { 's', 'h', 'j', 'k', 'l' },
        config = function()
            require('plugins.hop')
        end,
    },
    {
        'numToStr/comment.nvim',
        config = function()
            require('plugins.comment')
        end,
    },
    {
        'tkmpypy/chowcho.nvim',
        config = function()
            require('plugins.chowcho')
        end,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugins.indentline')
        end,
    },
    {
        'windwp/nvim-autopairs',
        lazy = true,
        config = function()
            require('plugins.autopairs')
        end,
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-github.nvim',
        },
        config = function()
            require('plugins.telescope')
        end,
    },
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = 'kyazdani42/nvim-web-devicons',
        commit = 'ba121f0244a3bd16919ba75c5ea12806a0538bd3',
        config = function()
            require('plugins.tree')
        end,
    },
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.gitsigns')
        end,
    },
    {
        'github/copilot.vim',
        event = "InsertEnter",
        config = function()
            vim.g.copilot_no_tab_map = 1
            vim.g.copilot_no_maps = 1
            vim.g.copilot_assume_mapped = 1
            vim.api.nvim_set_keymap("i", "<C-e>", "copilot#Accept()",
                { noremap = true, silent = true, expr = true })
            -- local map = require('utils').map
            -- map('i', '<C-e>', 'copilot#Accept()', { expr = true })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        dependencies = {
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
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
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
    },
    {
        'junnplus/lsp-setup.nvim',
        -- '~/Documents/workspace/nvim-lsp-setup',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'folke/lsp-colors.nvim',
            'folke/neodev.nvim',
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
    },
    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('plugins.toggleterm')
        end,
    },
    {
        'j-hui/fidget.nvim', -- nvim-lsp progress
        config = function()
            require('plugins.fidget')
        end,
    },
    {
        'glepnir/hlsearch.nvim',
        event = 'BufRead',
        config = function()
            require('hlsearch').setup()
        end
    },
}

require("lazy").setup(plugins)
