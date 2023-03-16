return {
    'petertriho/nvim-scrollbar',
    opts = function()
        local colors = require("tokyonight.colors").setup()
        return {
            handle = {
                cursor = false,
                color = colors.bg_highlight,
            },
            marks = {
                Search = { color = colors.orange },
                Error = { color = colors.error },
                Warn = { color = colors.warning },
                Info = { color = colors.info },
                Hint = { color = colors.hint },
                Misc = { color = colors.purple },
            },
            excluded_filetypes = { "NvimTree", "TelescopePrompt" }
        }
    end
}
