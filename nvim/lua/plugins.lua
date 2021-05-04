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
    use { 'nvim-lua/completion-nvim' }

    -- show a lightbulb in the gutter where a code action from lsp is available
    use { 'kosayoda/nvim-lightbulb' }

    -- use icons in the completion menus for lsp suggestions
    use { 'onsails/lspkind-nvim' }

    -- deoplete (autocomplete)
    use { 'shougo/deoplete-lsp' }
    use {
        'shougo/deoplete.nvim',
        run = ':UpdateRemotePlugins'
    }

    -- Treesitter (smart highlighting)
    use { 'nvim-treesitter/nvim-treesitter' }

    -- Format
    use { 'rhysd/vim-clang-format' }

    -- NERDTree
    use { 'preservim/nerdtree' }
    use { 'tiagofumo/vim-nerdtree-syntax-highlight' }
    use { 'Xuyuanp/nerdtree-git-plugin' }

    -- Git
    use { 'tpope/vim-fugitive' }

    -- Color schemes
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'marko-cerovac/material.nvim' }
    use { 'DilanGMB/nightbuddy' }
    use { 'folke/tokyonight.nvim' }

    -- Fuzzy finder
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim' }

    -- Omnisharp
    use { 'OmniSharp/omnisharp-vim' }

    -- Icons
    use { 'ryanoasis/vim-devicons' }
    use { 'kyazdani42/nvim-web-devicons' }
end)
