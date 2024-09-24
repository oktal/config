-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Map <C-[hl]> to move 5 by 5
vim.keymap.set("n", "<C-h>", "5h")
vim.keymap.set("n", "<C-l>", "5l")

-- Map <C-[jk]> to scroll page and center the line
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
