local syntax = require("config.zen_syntax")

require("aether").load({
  name = "zen-dark",
  styles = { keywords = { italic = false } },
  on_colors = syntax.on_colors,
  on_highlights = syntax.on_highlights,
  colors = {
    bg = "#121213",
    dark_bg = "#0c0c0d",
    darker_bg = "#09090a",
    lighter_bg = "#1c1c1e",

    fg = "#d4d5d8",
    dark_fg = "#9a9ba0",
    light_fg = "#e2e3e6",
    bright_fg = "#eeeff1",
    muted = "#6e7179",

    red = "#da615d",
    yellow = "#f7ba33",
    orange = "#e69d5a",
    green = "#6ab586",
    cyan = "#58b3cb",
    blue = "#6973df",
    purple = "#cf71bd",
    brown = "#a8834a",

    bright_red = "#ec7771",
    bright_yellow = "#ffc85b",
    bright_green = "#80c79a",
    bright_cyan = "#71c6dd",
    bright_blue = "#7b87ef",
    bright_purple = "#e187ce",

    accent = "#6973df",
    cursor = "#d4d5d8",
    foreground = "#d4d5d8",
    background = "#121213",
    selection = "#2c2d31",
    selection_foreground = "#d4d5d8",
    selection_background = "#2c2d31",
  },
})
