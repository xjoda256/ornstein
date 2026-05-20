-- ~/.config/hypr/hyprland.lua
-- xJoda

require("input")
require("plugins")

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("dbus-update-activation-environment --all")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("thunar --daemon")
	hl.exec_cmd("rivulet serve")
	hl.exec_cmd("[workspace 1] kitty --single-instance")
	hl.exec_cmd("dms run")
	hl.exec_cmd("kdeconnectd")
end)

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")

hl.config({
	general = {
		gaps_in = 4,
		gaps_out = 8,
		border_size = 2,
		resize_on_border = true,
		allow_tearing = false,
		layout = "master",
	},
	decoration = {
		rounding = 12,
		dim_inactive = true,
		dim_strength = 0.25,
		dim_special = 0.75,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		fullscreen_opacity = 1.0,
		shadow = {
			enabled = false,
			range = 30,
			render_power = 5,
			offset = "0 5",
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = false,
			size = 12,
			passes = 4,
			vibrancy = 1.85,
		},
	},
	dwindle = {
		smart_split = true,
		use_active_for_splits = true,
		precise_mouse_move = true,
	},
	master = {
		new_status = "master",
		mfact = 0.50,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
	},
	cursor = {
		no_warps = true,
		hide_on_key_press = true,
	},
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1.00 }, { 0.32, 1.00 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1.00 } } })
hl.curve("linear", { type = "bezier", points = { { 0.00, 0.00 }, { 1.00, 1.00 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.50, 0.50 }, { 0.75, 1.00 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0.00 }, { 0.10, 1.00 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0.00 }, { 0.15, 1.00 } } })
hl.curve("jodaBounce", { type = "bezier", points = { { 0.85, 1.35 }, { 0.25, 1.00 } } })

hl.animation({ leaf = "global", enabled = true, speed = 2.00, bezier = "easeInOutCirc" })
hl.animation({ leaf = "border", enabled = false, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 5.00, bezier = "easeInOutCirc", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5.00, bezier = "easeInOutCirc", style = "popin" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "jodaBounce" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4.00, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.50, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5.00, bezier = "jodaBounce", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 5.00, bezier = "jodaBounce", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 5.00, bezier = "jodaBounce", style = "slide" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7.00, bezier = "quick" })
hl.animation({
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = 4.00,
	bezier = "easeInOutCirc",
	style = "slide top",
})
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = 4.00,
	bezier = "easeInOutCirc",
	style = "slide bottom",
})
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 5.00, bezier = "almostLinear" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 5.00, bezier = "almostLinear" })
hl.animation({ leaf = "borderangle", enabled = false, speed = 5.00, bezier = "almostLinear", style = "loop" })

for i = 1, 6 do
	hl.workspace_rule({ workspace = tostring(i), persistent = true })
end

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "always-float",
	match = {
		class = "viewnior|nwg-look|gtk-pipe-viewer|nm-connection-editor|blueman-manager|waypaper|qalculate-gtk|meteo|mpv|xdg-desktop-portal-gtk",
	},
	float = true,
	center = true,
})

require("dms.colors")
