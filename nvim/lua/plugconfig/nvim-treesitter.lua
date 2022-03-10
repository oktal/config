local ts = require 'nvim-treesitter.configs'

ts.setup {
    ensure_installed = 'maintained',
    sync_install = false,
    highlight = {
        enable = true
    }
}
