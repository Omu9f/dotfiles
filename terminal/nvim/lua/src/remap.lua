local opts = { noremap = true, silent = true }

-- NAVIGATION
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half page + cursor position fixed
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up half page + cursor position fixed
vim.keymap.set({ "n", "v" }, "<A-j>", "9j", opts) -- move down 9 lines
vim.keymap.set({ "n", "v" }, "<A-k>", "9k", opts) -- move up 9 lines
vim.keymap.set({ "n", "v" }, "<A-h>", "9h", opts) -- move down 9 lines
vim.keymap.set({ "n", "v" }, "<A-l>", "9l", opts) -- move up 9 lines

-- MODIFY
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected code in v (down)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected code in v (up)

vim.keymap.set("v", "<C-/>", "gc") -- comment selected text

-- ACTIONS
vim.keymap.set("n", "<leader>a", "ggVG") -- select all text in file
vim.keymap.set("n", "s", ":w<CR>") -- save file
vim.keymap.set({ "i", "v" }, "C-c", "<esc>", opts) -- esc
vim.keymap.set({ "n", "v" }, "<leader>w", ":q<CR>", opts) -- quit
vim.keymap.set({ "n", "v" }, "<leader>q", ":q!<CR>", opts) -- quit all
-- vim.keymap.set("n", "<leader>e", ":Ex<CR>", opts) -- open netrw
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", opts) -- open netrw

vim.keymap.set("n", "<leader>u", ":Lazy update<CR>", opts) -- lazy update
-- replace word cursor is on (prime)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
