return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
  },
  config = function()
    local dapui = require("dapui")
    dapui.setup() -- dapui setup first to make it nice

    local dap = require("dap")

    dap.configurations.python = {
      {type = 'python',
        request = 'launch',
        name = 'My custom launch configuration',
        justMyCode = false,
        program = '${file}',
      },
    }

    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>db", ':DapToggleBreakpoint<CR>', { desc = "Toggle Dap Breakpoint" })
    vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>', { desc = "Dap Terminate" })
    vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>', { desc = "Dap Step Over" })

  end
}

