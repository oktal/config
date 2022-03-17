vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
        }
    }

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'nvim-lua/lsp_extensions.nvim' }
    use { 'p00f/clangd_extensions.nvim' }

    -- autocompletion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- show a lightbulb in the gutter where a code action from lsp is available
    -- use { 'kosayoda/nvim-lightbulb' }

    -- use icons in the completion menus for lsp suggestions
    use { 'onsails/lspkind-nvim' }

    -- Treesitter (smart highlighting)
    use { 'nvim-treesitter/nvim-treesitter' }

    -- Format
    -- use { 'rhysd/vim-clang-format' }

    -- File explore
    use { 'preservim/nerdtree' }
    use { 'Xuyuanp/nerdtree-git-plugin' }

    -- Git
    use { 'tpope/vim-fugitive' }

    -- Color schemes
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'marko-cerovac/material.nvim' }
    use { 'DilanGMB/nightbuddy' }
    use { 'folke/tokyonight.nvim' }
    use { 'EdenEast/nightfox.nvim' }

    -- Fuzzy finder
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim' }

    -- Omnisharp
    -- use { 'OmniSharp/omnisharp-vim' }

    -- Rust
    use { 'simrat39/rust-tools.nvim' }

    -- Icons
    use { 'kyazdani42/nvim-web-devicons' }

    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Motions
    use {
      'phaazon/hop.nvim',
      branch = 'v1'
    }
end)
