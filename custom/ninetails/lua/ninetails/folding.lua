local M = {}

M.setup = function()
  -- folding
  vim.opt.foldmethod = "indent"
  vim.opt.foldenable = false -- Automatically enable folding when opening files
  vim.opt.foldlevel = 99     -- prevent all folds from closing
end

return M
