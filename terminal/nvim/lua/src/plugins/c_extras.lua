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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     require("lualine").setup({
  --       options = {
  --         icons_enabled = true,
  --         theme = "auto",
  --         component_separators = { left = "", right = "" },
  --         section_separators = { left = "", right = "" },
  --         disabled_filetypes = {
  --           statusline = {},
  --           winbar = {},
  --         },
  --         ignore_focus = {},
  --         always_divide_middle = true,
  --         always_show_tabline = true,
  --         globalstatus = false,
  --         refresh = {
  --           statusline = 100,
  --           tabline = 100,
  --           winbar = 100,
  --         },
  --       },
  --       sections = {
  --         lualine_a = { "mode" },
  --         lualine_b = { "branch", "diff", "diagnostics" },
  --         lualine_c = { "filename" },
  --         lualine_x = { "encoding", "fileformat", "filetype" },
  --         lualine_y = { "progress" },
  --         lualine_z = { "location" },
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { "filename" },
  --         lualine_x = { "location" },
  --         lualine_y = {},
  --         lualine_z = {},
  --       },
  --       tabline = {},
  --       winbar = {},
  --       inactive_winbar = {},
  --       extensions = {},
  --     })
  --   end,
  -- },
}

return extras
