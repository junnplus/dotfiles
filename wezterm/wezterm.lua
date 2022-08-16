local wezterm = require('wezterm')

wezterm.on('format-tab-title', function(tab)
    local pane = tab.active_pane
    local title = tab.tab_index + 1 .. ': ' .. pane.title
    if pane['domain_name'] then
        title = title .. ' - (' .. pane.domain_name .. ')'
    end
    return title
end)

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
        top = -3,
        bottom = 0,
    },
    tab_max_width = 20,
    foreground_text_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.4,
    },
    default_cursor_style = 'BlinkingBlock',
    default_cwd = wezterm.home_dir .. '/Documents/workspace',
    clean_exit_codes = { 0, 1, 130 },
    -- exit_behavior = 'Close',
    keys = {
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
