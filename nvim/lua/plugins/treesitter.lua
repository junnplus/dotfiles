local ncmd = vim.api.nvim_command

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'go', 'python', 'zig', 'markdown', 'solidity', 'jsonnet' },
    highlight = {
        enable = true,
    },
    playground = {
        enable = true,
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { 'BufWrite', 'CursorHold' },
    },
    -- nvim-treesitter/nvim-treesitter-refactor
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'gnr',
            },
        },
    },
    indent = { enable = true },
    autopairs = { enable = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    -- RRethy/nvim-treesitter-endwise
    endwise = {
        enable = true,
    },
    -- andymass/vim-matchup
    matchup = {
        enable = true,
    },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
        },
    },
    -- yioneko/nvim-yati
    yati = { enable = true },
})
ncmd('set foldmethod=expr')
ncmd('set foldexpr=nvim_treesitter#foldexpr()')
