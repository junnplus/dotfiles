local map = require('utils').map
return {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        signs = {
            add = { text = '▌' },
            change = { text = '▌' },
            delete = { text = '▌' },
            topdelete = { text = '▌' },
            changedelete = { text = '▌' },
        },
        word_diff = false,
        current_line_blame = true,
        linehl = true,
        numhl = true,
        sign_priority = 6,
        preview_config = {
            border = 'rounded',
        },
        on_attach = function()
            local gs = package.loaded.gitsigns
            map('n', '<leader>hs', gs.stage_hunk)
            map('n', '<leader>hr', gs.reset_hunk)
            map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
            map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)

            map('n', ']c', function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gs.next_hunk() end)
                return '<Ignore>'
            end, { expr = true })

            map('n', '[c', function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gs.prev_hunk() end)
                return '<Ignore>'
            end, { expr = true })
        end
    }
}
