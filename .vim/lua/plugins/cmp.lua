local cmp = require'cmp'

cmp.setup{
    formatting = {
        format = function(entry, vim_item)
            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    },
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'cmp_tabnine' },
        { name = 'buffer' },
    }
}
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
})
