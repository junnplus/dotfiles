local wezterm = require('wezterm')
local io = require('io')
local os = require('os')

wezterm.on('window-visible-text', function(window, pane)
    local viewport_text = pane:get_lines_as_text()

    -- Create a temporary file to pass to vim
    local name = os.tmpname()
    local f = io.open(name, 'w+')
    if not f then
        return
    end
    f:write(viewport_text)
    f:flush()
    f:close()

    window:perform_action(
        wezterm.action.SpawnCommandInNewWindow {
            args = { 'vi', name },
        },
        pane
    )

    wezterm.sleep_ms(1000)
    os.remove(name)
end)


wezterm.on('format-tab-title', function(tab)
    local pane = tab.active_pane
    local title = '#' .. tab.tab_index + 1 .. ': ' .. pane.title
    if pane['domain_name'] then
        title = title .. ' - (' .. pane.domain_name .. ')'
    end
    return title
end)

wezterm.on('gui-startup', function()
    local mux = wezterm.mux
    local _, _, window = mux.spawn_window {}
    window:gui_window():maximize()
end)
