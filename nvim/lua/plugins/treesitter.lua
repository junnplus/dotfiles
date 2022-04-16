local ncmd = vim.api.nvim_command

require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'lua', 'rust', 'go', 'python' },
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
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'gnr',
            },
        },
    },
    -- indent = { enable = true },
    autopairs = { enable = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
    matchup = {
        -- matchup plugin
        enable = true,
    },
})
ncmd('set foldmethod=expr')
ncmd('set foldexpr=nvim_treesitter#foldexpr()')
