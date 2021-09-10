local ncmd = vim.api.nvim_command

require'nvim-treesitter.configs'.setup{
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
    }
}
ncmd('set foldmethod=expr')
ncmd('set foldexpr=nvim_treesitter#foldexpr()')
