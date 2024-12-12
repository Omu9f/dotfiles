local M = {}

M.setup = function()
  -- go specific options, there's probably a better way but i'm lazy rn
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "go",
    callback = function()
      vim.bo.expandtab = false -- Use tabs instead of spaces
      vim.bo.shiftwidth = 4    -- Set the width for auto-indents to 4
      vim.bo.tabstop = 4       -- Set the tab width to 4 spaces
    end,
  })
end

return M
