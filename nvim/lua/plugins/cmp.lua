local cmp = require('cmp')
local types = require('cmp.types')

local function input(keys, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), mode or 'i', true)
end

cmp.setup({
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = '[Buf]',
                nvim_lsp = '[LSP]',
                luasnip = '[Snip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Latex]',
            })[entry.source.name]
            return vim_item
        end,
    },
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
        ['<S-Tab>'] = function(fallback)
            if vim.fn.pumvisible() == 1 then
                input('<C-p>', 'n')
            elseif vim.fn['vsnip#jumpable']() == -1 then
                input('<Plug>(vsnip-jump-prev)')
            else
                fallback()
            end
        end,
        ['<C-y>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        ['<CR>'] = function(fallback)
            fallback()
        end,
        ['<C-e>'] = function(fallback)
            fallback()
        end,
    }),
    completion = {
        completeopt = 'menu,menuone,noselect',
    },
    preselect = types.cmp.PreselectMode.None,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'vsnip' },
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
