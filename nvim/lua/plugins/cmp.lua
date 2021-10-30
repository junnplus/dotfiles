local cmp = require('cmp')
local types = require('cmp.types')
local util = require('util')

cmp.setup{
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buf]",
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
                cmp_tabnine = "[TN]",
            })[entry.source.name]
            return vim_item
        end
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<Tab>'] = function (fallback)
            if vim.fn.pumvisible() == 1 then
                util.input("<C-n>", "n")
            elseif vim.fn['vsnip#available']() == 1 then
                util.input('<Plug>(vsnip-expand-or-jump)')
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function (fallback)
            if vim.fn.pumvisible() == 1 then
                util.input("<C-p>", "n")
            elseif vim.fn['vsnip#jumpable']() == -1 then
                util.input("<Plug>(vsnip-jump-prev)")
            else
                fallback()
            end
        end,
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ['<CR>'] = function (fallback)
            fallback()
        end,
        -- ['<C-n>'] = cmp.mapping.complete(),
    },
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    preselect = types.cmp.PreselectMode.None,
    sources = {
        { name = 'vsnip' },
        -- { name = 'luasnip' },
        -- { name = 'ultisnips' },
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
