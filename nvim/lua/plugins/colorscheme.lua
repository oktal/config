return {
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "EdenEast/nightfox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "catppuccin/nvim", name = "catppuccin" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightfox",
    },
  },
}
