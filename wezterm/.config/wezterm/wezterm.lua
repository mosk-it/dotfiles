-- Pull in the wezterm API
local wezterm = require("wezterm")

local act = wezterm.action
local config = wezterm.config_builder()

config.window_padding = {
	left = 2,
	right = 2,
	top = 1,
	bottom = 1,
}

config.scrollback_lines = 1000000

config.font = wezterm.font("SauceCodePro Nerd Font Mono", { weight = "Medium" })
config.font_size = 10
config.line_height = 0.85

-- config.color_scheme = 'Tomorrow Night Eighties'
config.colors = {
	-- background = '#14161B',
	background = "#222222",
}

config.leader = { key = "Space", mods = "CTRL", timeout_millisections = 1000 }

config.hide_tab_bar_if_only_one_tab = true


-- config.debug_key_events = true

-- Initialize global state for our copy mode if it doesn't exist
wezterm.GLOBAL.copy_mode_prefix = wezterm.GLOBAL.copy_mode_prefix or ""

-- Show the current number prefix in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	local status = ""

	if name == "copy_mode" and wezterm.GLOBAL.copy_mode_prefix ~= "" then
		status = "PREFIX: " .. wezterm.GLOBAL.copy_mode_prefix
	elseif name then
		status = "MODE: " .. name
	end

	window:set_right_status(status)
end)

-- Helper function to execute movement N times
local function execute_movement(window, pane, movement, count)
	for _ = 1, count do
		window:perform_action(movement, pane)
	end
end

-- direction: h|j|k|l|w|W|b
local function run_x_times_in_direction(window, pane, direction)
	direction = direction or "j"
	local count = 1
	if wezterm.GLOBAL.copy_mode_prefix ~= "" then
		count = tonumber(wezterm.GLOBAL.copy_mode_prefix) or 1
	end
	--
	local action = nil

	if direction == "l" then
		action = "MoveRight"
	elseif direction == "w" or direction == "W" then
		action = "MoveForward"
	elseif direction == "b" then
		action = "MoveBackward"
	elseif direction == "k" then
		action = "MoveUp"
	elseif direction == "j" then
		action = "MoveDown"
	else
		action = "MoveUp"
	end

	execute_movement(window, pane, wezterm.action.CopyMode(action), count)
	wezterm.GLOBAL.copy_mode_prefix = ""
end

-- Get the default copy mode key table and modify it
local copy_mode
if wezterm.gui then
	copy_mode = wezterm.gui.default_key_tables().copy_mode
	wezterm.log_info(copy_mode)

	-- Add handlers for digits 1-9
	for i = 1, 9 do
		table.insert(copy_mode, {
			key = tostring(i),
			mods = "NONE",
			action = wezterm.action_callback(function(window, pane)
				-- Update the prefix
				wezterm.GLOBAL.copy_mode_prefix = wezterm.GLOBAL.copy_mode_prefix .. tostring(i)
				-- Return false to indicate we didn't close the mode
				return false
			end),
		})
	end

	local directions = { "j", "l", "k", "h", "w", "W" }

	for _, d in ipairs(directions) do
		table.insert(copy_mode, {
			key = d,
			action = wezterm.action_callback(function(window, pane)
				run_x_times_in_direction(window, pane, d)
				return false
			end),
		})
	end
end

-- Configure key tables
config.key_tables = {
	copy_mode = copy_mode,
}

config.keys = {

	-- {
	-- 	{ key = "k", mods = "CTRL", action = "ToggleDropdown" },
	-- },

	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- Attach to muxer
	{
		key = "a",
		mods = "LEADER",
		action = wezterm.action.AttachDomain("unix"),
	},

	-- Detach from muxer
	{
		key = "d",
		mods = "LEADER",
		action = wezterm.action.DetachDomain({ DomainName = "unix" }),
	},

	{
		key = ",",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for session",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					wezterm.mux.rename_workspace(window:mux_window():get_workspace(), line)
				end
			end),
		}),
	},
	{
		key = "S",
		mods = "LEADER|SHIFT",
		action = wezterm.action.ShowLauncherArgs({ flags = "WORKSPACES" }),
	},
	{
		key = "/",
		mods = "CTRL",
		action = wezterm.action.ActivateCopyMode,
	}
}

return config
