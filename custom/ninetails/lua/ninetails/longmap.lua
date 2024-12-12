local M = {}

M.setup = function()
  -- LONG REMAPS --
  -- some remaps are lengthy and can cause clutter so we'll put them here

  -- ACTIONS
  vim.keymap.set("n", "z", function()
              local current_line = vim.fn.line(".")
    local is_folded = vim.fn.foldclosed(current_line)

    if is_folded ~= -1 then
      vim.cmd("normal! zo")
    else
      vim.cmd("normal! zc")
    end
  end, { noremap = true, silent = true }) -- toggle fold for current code block

  vim.keymap.set("n", "Z", function()
    local foldlevel = vim.api.nvim_eval('foldlevel(".")') -- Check the current fold level

    if foldlevel > 0 then
        vim.cmd("normal! zR")
    else
      vim.cmd("normal! zM")
    end
  end, { noremap = true, silent = true }) -- toggle fold for all code blocks

  -- cool ting
  vim.keymap.set({ "n", "v" }, "<A-t>", function()
    local mode = vim.fn.mode()
    if mode == "v" or mode == "V" then
      -- Visual mode: Copy and paste the visually selected text directly below
      vim.cmd('normal! y')       -- Yank the selected text
      vim.cmd('normal! `>p')     -- Paste directly below the selection
      vim.cmd('normal! gv')      -- Re-select the original selection
    else
      -- Normal mode: Copy and paste the current line directly below
      vim.cmd('normal! yy')      -- Yank the current line
      vim.cmd('normal! p') -- Open a new line, then paste
    end
  end, { noremap = true, silent = true })
end

return M
