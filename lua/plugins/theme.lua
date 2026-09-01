local omarchy = require("config.omarchy_theme")
local plugins, colorscheme = omarchy.read()

local specs = {}

for _, plugin in ipairs(plugins) do
  plugin.lazy = false
  plugin.priority = 1000
  specs[#specs + 1] = plugin
end

if colorscheme then
  -- Lower priority so this runs once the theme plugins above have loaded.
  specs[#specs + 1] = {
    name = "omarchy-colorscheme",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 999,
    config = function()
      pcall(vim.cmd.colorscheme, colorscheme)
    end,
  }
end

return specs
