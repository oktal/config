local actions = require('telescope.actions')
local previewers = require('telescope.previewers')

-- Setup Telescope
require('telescope').setup{
    defaults = {
        color_devicons = true,
        prompt_position = 'bottom',
        file_ignore_patterns = { 'build.*/.*' },
        set_env = { ['COLORTERM'] = 'truecolor' },
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new
    }
}

-- Bind key to telescope action
local map_telescope = function(keymap, picker, config)
  config = config or {} -- set default options to be a table if the user gives none
  config_string = ''

  local opts = { noremap = true, silent = true }

  for k,v in pairs(config) do config_string = config_string .. string.format('%s = %q, ', k, v) end
  local right_hand_side = string.format(":lua require('telescope.builtin').%s{%s}<cr>", picker, config_string)
  vim.api.nvim_set_keymap('n', keymap, right_hand_side, opts)
end

-- telescope builtins mappings
local rowselect_opts = { selection_strategy = 'row', hidden = true }
map_telescope('<leader>ld', "file_browser", rowselect_opts )
map_telescope('<leader>of', "oldfiles")
map_telescope('<leader>fc', "grep_string")
map_telescope('<leader>fj', "find_files", { hidden = true })
map_telescope('<leader>fw', "live_grep")
map_telescope('<leader>gl', "git_commits", rowselect_opts)
map_telescope('gh', "help_tags")
map_telescope('<leader>gm', "man_pages")
map_telescope('<leader>gs', "git_status", rowselect_opts)
map_telescope('<leader>la', "lsp_code_actions")
map_telescope('<leader>lb', "buffers")
map_telescope('<leader>lk', "keymaps")
map_telescope('<leader>lm', "marks")
map_telescope('<leader>lq', "quickfix")
map_telescope('<leader>lr', "registers")
map_telescope('<leader>ts', "builtin")
map_telescope('<leader>va', "autocommands")
map_telescope('<leader>vc', "commands")
map_telescope('<leader>vo', "vim_options")

map_telescope('<C-p>', "find_files", { hidden = true })
map_telescope('<C-b>', "buffers")
map_telescope('<C-f>', "live_grep")
