return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
        -- panel = {
        --     auto_refresh = true,
        -- },
        filetypes = {
            ['*'] = true,
        },
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = '<C-e>',
                next = '<C-j>',
                prev = '<C-k>',
            }
        }
    }
}
