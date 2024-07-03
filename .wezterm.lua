-- TODO: keys https://hackernoon.com/get-the-most-out-of-your-terminal-a-comprehensive-guide-to-wezterm-configuration

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local mux = wezterm.mux
local act = wezterm.action

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Material Palenight (base16)"
-- config.color_scheme = "MaterialOcean"
config.color_scheme = "Breeze (Gogh)"
-- {
--   "color_01": "#232627",
--   "color_02": "#ED1515",
--   "color_03": "#11D116",
--   "color_04": "#F67400",
--   "color_05": "#1D99F3",
--   "color_06": "#9B59B6",
--   "color_07": "#1ABC9C",
--   "color_08": "#FCFCFC",
--   "color_09": "#7F8C8D",
--   "color_10": "#C0392B",
--   "color_11": "#1CDC9A",
--   "color_12": "#FDBC4B",
--   "color_13": "#3DAEE9",
--   "color_14": "#8E44AD",
--   "color_15": "#16A085",
--   "color_16": "#FFFFFF",
--   "name": "Breeze",
--   "foreground": "#FCFCFC",
--   "background": "#232627",
--   "cursor": "#FCFCFC"
-- }
if not config.colors then
  config.colors = {}
end

config.bold_brightens_ansi_colors = "BrightOnly" -- BrightAndBold, No
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font = wezterm.font_with_fallback({
  -- "JuliaMono",
  -- "Monaco",
  "Hack",
  "Cascadia Mono",
  "Consolas",
  "Droid Sans Mono",
  "monospace"
})
config.font_size = 15

config.audible_bell = "Disabled"

config.default_cursor_style = "BlinkingBar"

config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

-- config.enable_scroll_bar = true
config.colors.scrollbar_thumb = "#FCFCFC"

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  -- config.default_domain = "WSL:Debian"
  config.default_prog = { "C:\\Windows\\system32\\wsl.exe", "~" }
end

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.exit_behavior = "Close"

-- config.initial_cols = 155
-- config.initial_rows = 35

-- maximize window on startup
wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window({})
  window:gui_window():maximize()
end)

-- show scroll bar if scrollback_rows > viewport_rows
wezterm.on("update-status", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local dimensions = pane:get_dimensions()
  overrides.enable_scroll_bar = dimensions.scrollback_rows > dimensions.viewport_rows
  window:set_config_overrides(overrides)
end)

-- config.disable_default_key_bindings = true
config.keys = {
  {
    key = "w",
    mods = "CTRL|SHIFT",
    action = wezterm.action.CloseCurrentTab({ confirm = false }),
  },
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom("Clipboard")
  },
  {
    key = "c",
    mods = "CTRL",
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ""
      if has_selection then
        window:perform_action(act.CopyTo("Clipboard"), pane)
        window:perform_action(act.ClearSelection, pane)
      else
        window:perform_action(act.SendKey({ key="c", mods="CTRL" }), pane)
      end
    end)
  }
}

-- and finally, return the configuration to wezterm
return config
