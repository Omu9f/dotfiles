local M = {}

M.setup = function()
  -- Global Format on Save
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
    callback = function()
      -- Check if an LSP client is attached and supports formatting
      local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })
      for _, client in ipairs(clients) do
        if client.supports_method("textDocument/formatting") then
          vim.lsp.buf.format({ async = false })
          return
        end
      end
    end,
  })
end

return M
