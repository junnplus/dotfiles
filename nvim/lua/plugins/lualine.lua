return {
    'hoob3rt/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
        options = {
            disabled_filetypes = { 'NvimTree' },
            theme = 'auto',
            section_separators = '',
            component_separators = '',
            -- globalstatus = true,
        },
    },
}
