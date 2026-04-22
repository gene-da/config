local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}
local target = wezterm.target_triple

config.window_decorations = "RESIZE"

config.initial_rows = 40
config.initial_cols = 140

config.font = wezterm.font_with_fallback({
	"BlexMono Nerd Font",
	"CaskaydiaCove Nerd Font",
	"SFMono Nerd Font",
	"JetBrains Mono",
	"Monaco",
})

config.font_size = 13.0
config.line_height = 1.1

config.colors = {
	foreground = "#e0e0e0",
	background = "#000000",

	cursor_bg = "#e0e0e0",
	cursor_fg = "#d02670",
	cursor_border = "#262626",

	selection_bg = "#525252",
	selection_fg = "#f4f4f4",

	ansi = {
		"#000000",
		"#fa4d56",
		"#08bdba",
		"#f1c21b",
		"#4589ff",
		"#ee5396",
		"#1192e8",
		"#ffffff",
	},

	brights = {
		"#a8a8a8",
		"#fa4d56",
		"#f1c21b",
		"#ee5396",
		"#be95ff",
		"#33b1ff",
		"#3ddbd9",
		"#ffd6e8",
	},

	tab_bar = {
		background = "#262626",
	},
}

config.window_background_opacity = 1.0
config.window_padding = { left = 0, right = 0, top = 5, bottom = 0 }

config.automatically_reload_config = true

local is_windows = target:find("windows")
local is_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
local is_mac = target:find("darwin")

if is_windows then
	config.default_prog = { "wsl.exe" }
elseif is_wsl then
	config.default_prog = { "zsh", "-l" }
elseif is_mac then
	config.default_prog = { "zsh", "-l" }
else
	config.default_prog = { "bash", "-l" }
end

config.enable_tab_bar = false
config.enable_scroll_bar = false
config.tab_bar_at_bottom = false
config.exit_behavior_messaging = "None"

config.disable_default_key_bindings = false

config.keys = {
	{ key = "l", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "q", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
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
