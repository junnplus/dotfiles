local wezterm = require('wezterm')

return {
    font = wezterm.font('Hack Nerd Font'),
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
    window_padding = {
        left = 5,
        right = 5,
        top = 0,
        bottom = 0,
    },
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.4,
    },
    use_ime = true, -- fixed chinese input
    default_cwd = wezterm.home_dir .. '/Documents/workspace',
    ssh_domains = {
        {
            name = 'archlinux',
            remote_address = '192.168.50.231',
            username = 'jun',
            multiplexing = 'None',
        },
    },
    keys = {
        { key = 'l', mods = 'CMD', action = wezterm.action({ ShowLauncherArgs = { flags = 'FUZZY|DOMAINS' } }) },
        { key = 's', mods = 'CMD', action = wezterm.action({ ShowLauncherArgs = { flags = 'FUZZY|WORKSPACES' } }) },
        { key = 'w', mods = 'CMD', action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
    },
}
