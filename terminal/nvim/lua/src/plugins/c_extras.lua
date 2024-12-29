local extras = {
  {
    dir = "~/codespace/superdev/ninetails",
    config = function()
      require("ninetails").setup()
    end,
  },
  -- {
  --   "supermaven-inc/supermaven-nvim",
  --   config = function()
  --     require("supermaven-nvim").setup({})
  --   end,
  -- },
}

return extras
