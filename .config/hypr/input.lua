-- ~/.config/hypr/input.lua
-- xJoda

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "dms ipc call spotlight toggle"
local browser     = "firefox"
local screenshot  = "dms screenshot all -d ~/Pictures/Screenshots/"

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:hyper, compose:ins, shift:both_capslock_cancel",
        kb_rules   = "",
        numlock_by_default = true,
        follow_mouse = 2,
        sensitivity  = 0.5,
        touchpad = {
            natural_scroll = true,
        },
    },
    binds = {
        workspace_back_and_forth = true,
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Application launchers
hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + F",      hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + W",      hl.dsp.exec_cmd(browser))
hl.bind("Print",          hl.dsp.exec_cmd(screenshot))
hl.bind("MOD3 + C",       hl.dsp.exec_cmd("qalculate-gtk"))
hl.bind("ALT + SHIFT + W", hl.dsp.exec_cmd("killall waybar; waybar"))
hl.bind("F8",             hl.dsp.exec_cmd("kitten quick-access-terminal"))
hl.bind("MOD3 + Space",   hl.dsp.exec_cmd("~/bin/wmenu-launcher"))
hl.bind("MOD3 + B",       hl.dsp.exec_cmd("~/bin/hypr-toggle-effects"))
hl.bind("SUPER + B",      hl.dsp.exec_cmd("dms ipc widget toggle battery"))
hl.bind("MOD3 + P",       hl.dsp.exec_cmd("hyprpicker -la >> docs/colors"))

-- Window management
hl.bind("SUPER + Q",      hl.dsp.window.close())
hl.bind("SUPER + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P",      hl.dsp.window.pseudo())
hl.bind("SUPER + J",      hl.dsp.layout("togglesplit"))
hl.bind("SUPER + K",      hl.dsp.layout("swapsplit"))
hl.bind("ALT + Return",   hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("MOD3 + Return",  hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("MOD3 + Tab",     hl.dsp.window.swap({ next = true }))

-- Focus movement
hl.bind("MOD3 + H",        hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + left",    hl.dsp.focus({ direction = "left" }))
hl.bind("MOD3 + L",        hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + right",   hl.dsp.focus({ direction = "right" }))
hl.bind("MOD3 + J",        hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + down",    hl.dsp.focus({ direction = "down" }))
hl.bind("MOD3 + K",        hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + up",      hl.dsp.focus({ direction = "up" }))

-- Resize windows
hl.bind("SUPER + MOD3 + left",       hl.dsp.window.resize({ x = -15, y = 0, relative = true }),  { repeating = true })
hl.bind("SUPER + MOD3 + right",      hl.dsp.window.resize({ x = 15, y = 0, relative = true }),   { repeating = true })
hl.bind("SUPER + MOD3 + up",         hl.dsp.window.resize({ x = 0, y = -15, relative = true }),  { repeating = true })
hl.bind("SUPER + MOD3 + down",       hl.dsp.window.resize({ x = 0, y = 15, relative = true }),   { repeating = true })
hl.bind("SUPER + MOD3 + SHIFT + left",  hl.dsp.window.resize({ x = -1, y = 0, relative = true }),  { repeating = true })
hl.bind("SUPER + MOD3 + SHIFT + right", hl.dsp.window.resize({ x = 1, y = 0, relative = true }),   { repeating = true })
hl.bind("SUPER + MOD3 + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -1, relative = true }),  { repeating = true })
hl.bind("SUPER + MOD3 + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 1, relative = true }),   { repeating = true })

-- Workspace switching
hl.bind("SUPER + bracketright", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + bracketleft",  hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + Tab",          hl.dsp.workspace.toggle_special("special"))
hl.bind("SUPER + mouse_down",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up",     hl.dsp.focus({ workspace = "e+1" }))

for i = 1, 9 do
    hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind("SHIFT + ALT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Move windows to workspaces
hl.bind("SHIFT + ALT + right", hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SHIFT + ALT + L",     hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("SHIFT + ALT + left",  hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SHIFT + ALT + H",     hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SHIFT + ALT + K",     hl.dsp.window.move({ workspace = "special" }))
hl.bind("SHIFT + ALT + up",    hl.dsp.window.move({ workspace = "special" }))

-- Mouse binds
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioNext",       hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev",       hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioPlay",       hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause",      hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Laptop keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- DMS ipc binds
hl.bind("SUPER + Space",  hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
hl.bind("SUPER + L",      hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind("SUPER + M",      hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind("SUPER + comma",  hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind("SUPER + N",      hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind("SUPER + Y",      hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"))
hl.bind("SUPER + C",      hl.dsp.exec_cmd("dms ipc call control-center toggle"))
hl.bind("SUPER + O",      hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))
hl.bind("SUPER + U",      hl.dsp.exec_cmd("dms ipc call dash toggle [tab]"))
