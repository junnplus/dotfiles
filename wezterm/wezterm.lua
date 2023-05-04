require('event')

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
    window_decorations = 'INTEGRATED_BUTTONS|RESIZE',
    window_padding = {
        left = 5,
        right = 5,
        top = -3,
        bottom = 0,
    },
    tab_max_width = 20,
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.4,
    },
    -- tempfile=$(mktemp) \
    -- && curl -o $tempfile https://raw.githubusercontent.com/wez/wezterm/main/termwiz/data/wezterm.terminfo \
    -- && tic -x -o ~/.terminfo $tempfile \
    -- && rm $tempfile
    term = 'wezterm',
    default_cursor_style = 'BlinkingBlock',
    default_cwd = wezterm.home_dir .. '/Documents/workspace',
    native_macos_fullscreen_mode = true,
    -- status_update_interval = 5000,
    clean_exit_codes = { 0, 1, 130 },
    -- exit_behavior = 'Close',
    keys = {
        { key = 'e', mods = 'CMD', action = wezterm.action({ EmitEvent = 'window-visible-text' }) },
        { key = 'l', mods = 'CMD', action = wezterm.action({ ShowLauncherArgs = { flags = 'DOMAINS' } }) },
        { key = 'w', mods = 'CMD', action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
        { key = 'd', mods = 'CMD', action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
        {
            key = 'd',
            mods = 'CMD|SHIFT',
            action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }),
        },
        {
            key = '[',
            mods = 'CMD',
            action = wezterm.action({ ActivatePaneDirection = 'Next' }),
        },
        {
            key = ']',
            mods = 'CMD',
            action = wezterm.action({ ActivatePaneDirection = 'Prev' }),
        },
        {
            key = '>',
            mods = 'CMD|SHIFT',
            action = wezterm.action.MoveTabRelative(1),
        },
        {
            key = '<',
            mods = 'CMD|SHIFT',
            action = wezterm.action.MoveTabRelative(-1),
        },
        { key = 'Enter', mods = 'CMD', action = 'ToggleFullScreen' },
    },
    quote_dropped_files = 'Posix',
    hyperlink_rules = {
        {
            regex = [[\b(https|http)://\S*\b]],
            format = '$0',
        },
        {
            regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
            format = 'https://www.github.com/$1/$3',
        }
    }
}
