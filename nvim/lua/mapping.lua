-- Helpers
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')

local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map C-p to Telescope find_files and C-b to Telescope buffers
cmd 'nnoremap <C-p> <cmd>Telescope find_files<CR>'
cmd 'nnoremap <C-b> <cmd>Telescope buffers<CR>'

-- Map C-n to NERDTreeToggle
cmd 'nnoremap <C-n> <cmd>NERDTreeToggle<CR>'

-- Navigation
cmd 'nnoremap <C-h> 5h'
cmd 'nnoremap <C-j> 5j'
cmd 'nnoremap <C-k> 5k'
cmd 'nnoremap <C-l> 5l'

-- C-d to jump to declaration
map('n', '<C-d>', '<cmd>lua vim.lsp.buf.declaration()<CR>')
-- C-kC-f to trigger ClangFormat
map('n', '<C-k><C-f>', '<cmd>ClangFormat<CR>')


-- Global Substitute: same as %s/
map('n', 'gs', ':%s/')
map('v', 'gs', ':%s/')
-- Linewise Substitute: same as s/
map('n', 'gl', ':s/')
map('v', 'gl', ':s/')

-- toggle relativenumber on/off for all windows
function toggle_numbers(buf_win_or_tab)
  local command = buf_win_or_tab or 'windo set '
  if vim.api.nvim_win_get_option(0, 'relativenumber') then
    vim.cmd(command .. 'norelativenumber')
  else
    vim.cmd(command .. 'relativenumber')
  end
end

map('n', '<leader>tn', ':lua toggle_numbers()<cr>')
