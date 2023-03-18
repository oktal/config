-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map <C-[hjkl]> to move 5 by 5
vim.keymap.set("n", "<C-h>", "5h")
vim.keymap.set("n", "<C-j>", "5j")
vim.keymap.set("n", "<C-k>", "5k")
vim.keymap.set("n", "<C-l>", "5l")
