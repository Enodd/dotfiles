local wezterm = require("wezterm")
local config = wezterm.config_builder()

Font = "GeistMono Nerd Font Mono"

config.font = wezterm.font(Font)
config.font_size = 14
config.line_height = 1.1
config.window_background_opacity = 0.8
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.macos_window_background_blur = 20
config.window_frame = {
	font = wezterm.font(Font),
	font_size = 14,
}

local dark = "Everforest Dark (Gogh)"
local light = "Everforest Light (Gogh)"

local current = "dark"

config.color_scheme = dark
local function toggle_theme(window, pane)
	local overrides = window:get_config_overrides() or {}

	if current == "dark" then
		overrides.color_scheme = light
		current = "light"
	else
		overrides.color_scheme = dark
		current = "dark"
	end
	local home = wezterm.home_dir
	local f = io.open(home .. "/.nvim_theme", "w")
	if f then
		f:write(current)
		f:close()
	end

	window:set_config_overrides(overrides)
end

config.keys = {
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = wezterm.action_callback(toggle_theme),
	},
}

return config
