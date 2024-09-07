-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Essentials
keymap.set("n", "<C-a>", "gg<S-v>G") -- select all in normal mode
keymap.set("v", "<C-c>", '"+y')      -- copy in visual mode
keymap.set("v", "<C-x>", '"+d')      -- cut in visual mode
keymap.set("n", "<C-v>", '"+p')      -- paste in normal mode
keymap.set("v", "<C-v>", '"+p')      -- paste in visual mode

-- Save file and quit
keymap.set("n", "<Leader>w", ":update<Return>", opts)
keymap.set("n", "<Leader>q", ":qa<Return>", opts)
keymap.set("n", "<Leader>Q", ":quit<Return>", opts)

-- File explorer with NvimTree
keymap.set("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap.set("n", "<Leader>e", ":NvimTreeToggle<Return>", opts)
