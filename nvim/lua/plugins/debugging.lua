return {
  -- Core DAP
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Keymaps for general debugging
      vim.keymap.set("n", "<F5>", dap.continue)
      vim.keymap.set("n", "<F10>", dap.step_over)
      vim.keymap.set("n", "<F11>", dap.step_into)
      vim.keymap.set("n", "<F12>", dap.step_out)
      vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
      vim.keymap.set("n", "<leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end)
      vim.keymap.set("n", "<leader>dr", dap.repl.open)
      vim.keymap.set("n", "<leader>dl", dap.run_last)
    end,
  },

  -- DAP UI
  {
  "nvim-neotest/nvim-nio",
  lazy = false,
},

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      -- Open/close UI automatically
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
    keys = {
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Toggle DAP UI" },
    },
  },

  -- DAP Python
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function()
      local dap = require("dap")
      local dap_python = require("dap-python")

      -- Setup debugpy with your Python interpreter
      dap_python.setup("python3")

      -- Python launch configuration
      dap.configurations.python = {
        {
          type = "python",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          pythonPath = function()
            local venv = os.getenv("VIRTUAL_ENV")
            if venv then
              return venv .. "/bin/python"
            else
              return "python3"
            end
          end,
        },
      }
       -- GDB adapter
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap" },
      }

      -- C / C++ configuration
      dap.configurations.c = {
        {
          name = "Debug",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = true,
        },
      }

      dap.configurations.cpp = dap.configurations.c
    end,
  },

  -- Virtual text (inline variable values)
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("nvim-dap-virtual-text").setup {
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        show_stop_reason = true,
        commented = false,
        only_first_definition = false,
        all_references = false,
      }
    end,
  },
}

