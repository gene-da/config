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

config.font_size = 16.0
config.line_height = 1.0

config.colors = require("colors")

config.window_background_opacity = 1.0
config.window_padding = { left = 5, right = 0, top = 0, bottom = 0 }

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

return config
