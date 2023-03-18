return {
  "mfussenegger/nvim-dap",

  config = function()
    local dap = require("dap")

    dap.adapters.coreclr = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.adapters.netcoredbg = {
      type = "executable",
      command = "netcoredbg",
      args = { "--interpreter=vscode" },
    }

    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
      },
    }

    vim.api.nvim_set_hl(0, "blue", { fg = "#3d59a1" })
    vim.api.nvim_set_hl(0, "green", { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "yellow", { fg = "#FFFF00" })
    vim.api.nvim_set_hl(0, "orange", { fg = "#f09000" })
    vim.api.nvim_set_hl(0, "red", { fg = "#FF0000" })

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "red" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "red" })
    vim.fn.sign_define("DapStopped", { text = "", texthl = "green" })
  end,
  keys = {
    { "<F5>", "<Cmd>lua require'dap'.continue()<CR>", desc = "Continue" },
    { "<F10>", "<Cmd>lua require'dap'.step_over()<CR>", desc = "Step over" },
    { "<F11>", "<Cmd>lua require'dap'.step_into()<CR>", desc = "Step into" },
    { "<F12>", "<Cmd>lua require'dap'.step_out()<CR>", desc = "Step out" },
    { "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
    {
      "<leader>dc",
      "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
      desc = "Set conditional breakpoint",
    },
    { "<leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>", desc = "Open REPL (Debug)" },
  },
}
