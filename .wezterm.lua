local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Open maximized window wo title
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.check_for_updates = true
config.check_for_updates_interval_seconds = 86400

config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = false })
config.font_size = 16

config.keys = {
	-- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
	{ key = "LeftArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bb" }) },
	-- Make Option-Right equivalent to Alt-f; forward-word
	{ key = "RightArrow", mods = "OPT", action = wezterm.action({ SendString = "\x1bf" }) },
}
config.enable_tab_bar = false
config.send_composed_key_when_left_alt_is_pressed = true
config.use_ime = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "0cell",
	right = "0cell",
	top = "0cell",
	bottom = "0cell",
}

return config
