-- lua/src/init.lua
local ninetails = {}

ninetails.setup = function(opts)
  opts = opts or {}

  -- Initialize the ones that need setup
  require("ninetails.options").setup()
  require("ninetails.longmap").setup()
  require("ninetails.folding").setup()
  require("ninetails.go_opts").setup()

  -- initialize the plugins

  -- Add other optional configurations based on `opts` if needed
  -- if opts.enable_feature_x then
  --   print("Feature X is enabled!") -- Example placeholder
  -- end
end

return ninetails
