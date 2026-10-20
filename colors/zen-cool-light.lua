local syntax = require("config.zen_syntax")

require("aether").load({
  name = "zen-cool-light",
  styles = { keywords = { italic = false } },
  on_colors = syntax.on_colors,
  on_highlights = syntax.on_highlights,
  colors = {
    bg = "#f1f3f8",
    dark_bg = "#e7eaef",
    darker_bg = "#dce0e6",
    lighter_bg = "#eaedf2",

    fg = "#1e2228",
    dark_fg = "#5a5e65",
    light_fg = "#13161c",
    bright_fg = "#090b0f",
    muted = "#82868e",

    red = "#be4746",
    yellow = "#8f6900",
    orange = "#ac6120",
    green = "#317d51",
    cyan = "#09788f",
    blue = "#5b63ce",
    purple = "#a84d97",
    brown = "#8a5a2b",

    bright_red = "#a93435",
    bright_yellow = "#7d5700",
    bright_green = "#1b6b41",
    bright_cyan = "#006a80",
    bright_blue = "#4c51ba",
    bright_purple = "#943b84",

    accent = "#5b63ce",
    cursor = "#1e2228",
    foreground = "#1e2228",
    background = "#f1f3f8",
    selection = "#d9dee7",
    selection_foreground = "#1e2228",
    selection_background = "#d9dee7",
  },
})
