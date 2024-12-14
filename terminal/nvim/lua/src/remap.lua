local opts = { noremap = true, silent = true }

-- NAVIGATION
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- move down half page + cursor position fixed
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- move up half page + cursor position fixed

-- MODIFY
vim.keymap.set("n", "<C-m>", "viw") -- select a word
vim.keymap.set("v", "<leader>x", [["+ydd]]) -- cut selection to sys clipboard
vim.keymap.set("v", "<leader>y", [["+y]]) -- copy to sys clipboard (prime + asbjornHaland)
vim.keymap.set("n", "<leader>p", '"+pe') -- paste from system clipboard

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected code in v (down)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected code in v (up)

-- ACTIONS
vim.keymap.set("n", "s", ":w<CR>") -- save file
vim.keymap.set("n", "<leader>a", "ggVG") -- select all text in file
vim.keymap.set({ "i", "v", "n" }, "C-c", "<esc>", opts) -- esc
vim.keymap.set({ "n", "v" }, "<leader>w", ":q<CR>", opts) -- quit
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts) -- quit all
vim.keymap.set("n", "<leader>e", ":Ex<CR>", opts) -- open netrw

vim.keymap.set("n", "<leader>u", ":Lazy update<CR>", opts) -- lazy update
-- replace word cursor is on (prime)
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- LSP
vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
