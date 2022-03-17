-- Helpers
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

-- Map leader to space
g.mapleader = ' '

-- Syntax
cmd 'syntax enable'
cmd 'filetype plugin on'
cmd 'set number'

-- Indentation
local indent = 4
opt('b', 'expandtab', true)
opt('b', 'shiftwidth', indent)
opt('b', 'smartindent', true)
opt('b', 'tabstop', indent)

opt('o', 'completeopt', 'menuone,noinsert,noselect')

-- Window
opt('w', 'relativenumber', true)

-- Setup color scheme
-- g.material_style = 'deep ocean'
-- require('colorbuddy').colorscheme('material')

cmd('colorscheme nightfox')
