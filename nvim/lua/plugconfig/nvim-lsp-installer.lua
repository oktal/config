local lsp_installer = require("nvim-lsp-installer")

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
  buf_set_keymap('n', '<leader>ca', ':Telescope lsp_code_actions<cr>', opts)
  buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<cr>', opts)

  buf_set_keymap('n', 'F', ':lua vim.lsp.buf.references()<cr>', opts)
end

-- Setup Autocompletion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = { on_attach = on_attach, capabilities = capabilities }

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
