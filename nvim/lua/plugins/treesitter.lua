local ncmd = vim.api.nvim_command

require('nvim-treesitter.configs').setup{
    ensure_installed = "maintained",
    highlight = {
        enable = true,
    },
    playground = {
        enable = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = 'gnr',
            }
        }
    },
    indent = { enable = true },
    autopairs = { enable = true },
    rainbow = { enable = true },
    autotag = { enable = true },
    context_commentstring = { enable = true },
}
ncmd('set foldmethod=expr')
ncmd('set foldexpr=nvim_treesitter#foldexpr()')
