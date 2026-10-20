local syntax = require("config.zen_syntax")

require("aether").load({
  name = "zen-cool-dark",
  styles = { keywords = { italic = false } },
  on_colors = syntax.on_colors,
  on_highlights = syntax.on_highlights,
  colors = {
    bg = "#161a20",
    dark_bg = "#101318",
    darker_bg = "#0b0d12",
    lighter_bg = "#1e2229",

    fg = "#d1d4db",
    dark_fg = "#9a9fa6",
    light_fg = "#e2e5ea",
    bright_fg = "#e9ebef",
    muted = "#727881",

    red = "#da615d",
    yellow = "#f7ba33",
    orange = "#e69d5a",
    green = "#6ab586",
    cyan = "#58b3cb",
    blue = "#707be8",
    purple = "#cf71bd",
    brown = "#a8834a",

    bright_red = "#ec7771",
    bright_yellow = "#ffc85b",
    bright_green = "#80c79a",
    bright_cyan = "#71c6dd",
    bright_blue = "#7b87ef",
    bright_purple = "#e187ce",

    accent = "#707be8",
    cursor = "#d1d4db",
    foreground = "#d1d4db",
    background = "#161a20",
    selection = "#2b303a",
    selection_foreground = "#d1d4db",
    selection_background = "#2b303a",
  },
})
