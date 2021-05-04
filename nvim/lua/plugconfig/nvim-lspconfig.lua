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

-- Enable Rust analyzer
-- local on_rust_analyzer_attach = function(client)
--     require('completion').on_attach(client)
-- end

-- lsp.rust_analyzer.setup({ on_attach = on_rust_analyzer_attch })

-- Enable Omnisharp
local omnisharp_bin = "/home/octal/omnisharp/run"
vim.g.OmniSharp_server_path = omnisharp_bin

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

local servers = { 'clangd', 'gopls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup { on_attach = on_attach }
end
