local Util = require("lazyvim.util")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<C-f>", Util.telescope("live_grep"), desc = "Find in files (Grep)" },
    { "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<C-p>", Util.telescope("files", { cwd = false }), desc = "Find files" },
  },
  config = function()
    require("telescope").load_extension("notify")
  end,
}
