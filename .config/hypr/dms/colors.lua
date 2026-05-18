-- ! Auto-generated file. Do not edit directly.
-- Remove the require("dms.colors") line from your config to override.

local colors = {
	primary = "rgb(ffb77a)",
	outline = "rgb(829493)",
	error   = "rgb(ffb4ab)",
}

hl.config({
	general = {
		["col.active_border"]   = colors.primary,
		["col.inactive_border"] = colors.outline,
	},
	group = {
		["col.border_active"]          = colors.primary,
		["col.border_inactive"]        = colors.outline,
		["col.border_locked_active"]   = colors.error,
		["col.border_locked_inactive"] = colors.outline,
		groupbar = {
			["col.active"]          = colors.primary,
			["col.inactive"]        = colors.outline,
			["col.locked_active"]   = colors.error,
			["col.locked_inactive"] = colors.outline,
		},
	},
})

return colors
