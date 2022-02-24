local wezterm = require 'wezterm';

return {
    font = wezterm.font("Hack Nerd Font Mono", {weight="Regular",stretch="Expanded"}),
    font_size = 14,
    freetype_load_target = "HorizontalLcd",
    freetype_render_target = "HorizontalLcd",
    allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
    -- color_scheme = "Dracula+",
    colors = {
        foreground = "#c0caf5",
        background = "#24283b",
        cursor_bg = "#c0caf5",
        cursor_border = "#c0caf5",
        cursor_fg = "#24283b",
        selection_bg = "#364A82",
        selection_fg = "#c0caf5",
        ansi = {"#1D202F", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#a9b1d6"},
        brights = {"#414868", "#f7768e", "#9ece6a", "#e0af68", "#7aa2f7", "#bb9af7", "#7dcfff", "#c0caf5"},
        tab_bar = {
            active_tab = {
                bg_color = "#24283b",
                fg_color = "#c0caf5",
            }
        },
    },
    window_frame = {
        font_size = 13.0,
    },
    use_ime = true,  -- fixed chinese input
    default_cwd = "/Users/jun/Documents/workspace",
    keys = {
        {key="l", mods="CMD", action="ShowLauncher"},
    }
}
