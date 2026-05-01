local wezterm = require("wezterm")

local config = wezterm.config_builder and wezterm.config_builder() or {}
local target = wezterm.target_triple

config.initial_rows = 40
config.initial_cols = 140

config.font = wezterm.font_with_fallback({
	"BlexMono Nerd Font",
	"CaskaydiaCove Nerd Font",
	"SFMono Nerd Font",
	"JetBrains Mono",
	"Monaco",
})

config.font_size = 14.0
config.line_height = 1.0

local colors = {
	foreground = "#FFFFFF",
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

config.colors = colors

config.window_background_opacity = 1.0
config.window_padding = { left = 5, right = 5, top = 5, bottom = 5 }

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

local action = wezterm.action

config.keys = {
	{
		key = "h",
		mods = "CTRL|SHIFT|ALT",
		action = action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "CTRL|SHIFT|ALT",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "CTRL|SHIFT",
		action = action.ActivateTabRelative(1),
	},
	{
		key = "Tab",
		mods = "CTRL|SHIFT",
		action = action.ActivateTabRelative(-1),
	},
	{
		key = "c",
		mods = "CTRL|SHIFT|ALT",
		action = action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "q",
		mods = "CTRL|SHIFT|ALT",
		action = action.CloseCurrentTab({ confirm = true }),
	},
	{
		key = "1",
		mods = "ALT",
		action = action.ActivateTab(0),
	},
	{
		key = "2",
		mods = "ALT",
		action = action.ActivateTab(0),
	},
	{
		key = "3",
		mods = "ALT",
		action = action.ActivateTab(0),
	},
	{
		key = "4",
		mods = "ALT",
		action = action.ActivateTab(0),
	},
	{
		key = "5",
		mods = "ALT",
		action = action.ActivateTab(0),
	},
	{
		key = "H",
		mods = "ALT|SHIFT",
		action = action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "L",
		mods = "ALT|SHIFT",
		action = action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		key = "K",
		mods = "ALT|SHIFT",
		action = action.AdjustPaneSize({ "Up", 5 }),
	},
	{
		key = "J",
		mods = "ALT|SHIFT",
		action = action.AdjustPaneSize({ "Down", 5 }),
	},
}

return config
