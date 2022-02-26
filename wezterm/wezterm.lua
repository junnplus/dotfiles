local wezterm = require('wezterm')

return {
    font = wezterm.font('Hack Nerd Font Mono'),
    font_size = 14,
    colors = {
        tab_bar = {
            active_tab = {
                bg_color = '#24283b',
                fg_color = '#c0caf5',
            },
        },
    },
    color_scheme = 'tokyonight',
    window_frame = {
        font_size = 14.0,
    },
    -- window_decorations = 'RESIZE',
    -- use_fancy_tab_bar = true,
    use_ime = true, -- fixed chinese input
    default_cwd = '/Users/jun/Documents/workspace',
    keys = {
        { key = 'l', mods = 'CMD', action = 'ShowLauncher' },
        { key = 'w', mods = 'CMD', action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
    },
}
