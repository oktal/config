require('lspkind').init()

local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)

  -- aliases for keybinds below
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- set up omnifunc
  buf_set_option('omnifunc', 'v:lua,vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<cr>', opts)
  buf_set_keymap('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', '<leader>pa', ':lua vim.lsp.buf.add_workspace_folder()<cr>', opts) -- project add directory
  buf_set_keymap('n', '<leader>pr', ':lua vim.lsp.buf.remove_workspace_folder()<cr>', opts) -- project remove directory
  buf_set_keymap('n', '<leader>pd', ':lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>', opts) -- project directory
  buf_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<leader>td', ':lua vim.lsp.buf.type_definition()<cr>', opts)
  buf_set_keymap('n', '<leader>gr', ':lua vim.lsp.buf.references()<cr>', opts)
  buf_set_keymap('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<cr>', opts)

  buf_set_keymap('n', 'F', ':lua vim.lsp.buf.references()<cr>', opts)
end

-- Enable Omnisharp
local omnisharp_bin = "/home/octal/omnisharp/run"
vim.g.OmniSharp_server_path = omnisharp_bin

-- Setup LSP servers
local servers = { 'jedi-language-server', 'gopls' }

-- Setup Autocompletion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup{ on_attach = on_attach, capabilities = capabilities }
end

-- Setup clangd extensions
require("clangd_extensions").setup {
    server = {
        on_attach = on_attach,
        capabilities = capabilities
        -- options to pass to nvim-lspconfig
        -- i.e. the arguments to require("lspconfig").clangd.setup({})
    },
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
        },
        memory_usage = {
            border = "none",
        },
        symbol_info = {
            border = "none",
        },
    },
}

-- Setup rust tools
require('rust-tools').setup{}
