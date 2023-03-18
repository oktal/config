return {
  {
    "Issafalcon/neotest-dotnet",
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
      "nvim-neotest/neotest-python",
      "rouge8/neotest-rust",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-dotnet"),
          require("neotest-python"),
          require("neotest-rust"),
        },
        icons = {
          running_animated = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
          passed = "﫟",
          unknown = "",
          failed = "",
        },
      })
    end,
    keys = {
      {
        "<leader>tr",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      {
        "<leader>td",
        function()
          require("neotest").run.run({ strategy = "dap" })
        end,
        desc = "Debug nearest test",
      },
      {
        "<leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run current test file",
      },
      {
        "<leader>ta",
        function()
          require("neotest").run.run({ suite = true })
        end,
        desc = "Run all tests from the current test suite",
      },
      {
        "<leader>tw",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary window",
      },
    },
  },
}
