vim.g.mapleader = " "

vim.opt.guicursor = "" -- fat insert cursor

-- vim.opt.laststatus = 0
vim.opt.termguicolors = true

vim.opt.number = true -- show line number
vim.opt.relativenumber = true -- use relative line number
vim.opt.scrolloff = 8
vim.opt.wrap = false

vim.opt.cul = true
vim.opt.culopt = "number" -- these highlight the line num the cursor is on

vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.timeoutlen = 300 -- timeout for keybinds
-- vim.opt.ttimeoutlen = 500

vim.opt.clipboard:append("unnamedplus") -- always use system clipboard
