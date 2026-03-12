local wezterm = require("wezterm")
local config = wezterm.config_builder and wezterm.config_builder() or {}

config.window_decorations = "RESIZE"

config.initial_rows = 40
config.initial_cols = 140

config.font = wezterm.font("Liga SFMono Nerd Font")
config.font_size = 13.0
config.line_height = 1.1

config.color_scheme_dirs = { "//wsl$/Ubuntu-24.04/home/edanniii/.config/wezterm/colors" }
config.color_scheme = "Oxocarbon Dark"

config.window_background_opacity = 1.0
config.window_padding = { left = 0, right = 0, top = 5, bottom = 0 }

config.automatically_reload_config = true

config.default_prog = { "wsl.exe" }

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.tab_bar_at_bottom = false
config.exit_behavior_messaging = "None"

config.disable_default_key_bindings = false

config.keys = {
	{ key = "l", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "\\", mods = "CTRL", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "Enter", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
}

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.SelectTextAtMouseCursor("Cell"),
	},
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.ExtendSelectionToMouseCursor("Cell"),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
	{
		event = { Up = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
}

return config
