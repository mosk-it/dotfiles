-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
  left = 2,
  right = 2,
  top = 1,
  bottom = 1,
}

config.scrollback_lines = 1000000

config.font =  wezterm.font('SauceCodePro Nerd Font Mono', { weight = 'Medium' })
config.font_size = 10


return config
