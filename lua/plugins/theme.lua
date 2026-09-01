local plugins = require("config.omarchy_theme").read()

for _, plugin in ipairs(plugins) do
  plugin.lazy = false
  plugin.priority = 1000
end

return plugins
