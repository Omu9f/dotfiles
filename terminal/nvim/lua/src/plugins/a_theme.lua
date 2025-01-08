-- theme for aesthetics
return {
  {
    dir = "~/codespace/superdev/memento.nvim",
    priority = 1000,
    config = function()
      require("memento").setup({
        style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent", -- style for sidebars, see below
          floats = "transparent", -- style for floating windows
        },
      })
      -- set the colorscheme
      vim.cmd.colorscheme("memento")
    end,
  },
  {
    "sainnhe/sonokai",
    priority = 1000,
    config = function()
      vim.g.sonokai_transparent_background = "1"
      vim.g.sonokai_enable_italic = "0"
      vim.g.sonokai_style = "andromeda"
      -- set the colorscheme
      -- vim.cmd.colorscheme("sonokai")
    end,
  },
}
