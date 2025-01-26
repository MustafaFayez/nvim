return {
  -- nvim-dap: Core Debug Adapter Protocol client
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- nvim-dap-python: Adapter for Python debugging
      'mfussenegger/nvim-dap-python',
      -- nvim-dap-ui: UI for nvim-dap
      'rcarriga/nvim-dap-ui',
      -- nvim-dap-virtual-text: Inline variable display (optional)
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function()
      -- Require the necessary modules
      local dap = require('dap')
      local dap_python = require('dap-python')
      local dapui = require('dapui')

      -- Setup dap-python with your Python interpreter
      dap_python.setup('~/.virtualenvs/debugpy/bin/python') -- Adjust the path as needed

      -- Setup dap-ui
      dapui.setup()

      -- Automatically open and close dap-ui
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      -- Load VSCode launch configurations
      -- require('dap.ext.vscode').load_launchjs()

      -- Define sign for breakpoints
      vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='', linehl='', numhl=''})

      -- Key mappings for debugging
      local opts = { noremap=true, silent=true }
      vim.api.nvim_set_keymap('n', '<Leader>dc', '<Cmd>lua require("dap").continue()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>dso', '<Cmd>lua require("dap").step_over()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>dsi', '<Cmd>lua require("dap").step_into()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>dst', '<Cmd>lua require("dap").step_out()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>db', '<Cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
      vim.api.nvim_set_keymap('n', '<Leader>dB', '<Cmd>lua require("dap").set_breakpoint(vim.fn.input("Condition: "))<CR>', opts)

      -- Setup nvim-dap-virtual-text (optional)
      require('nvim-dap-virtual-text').setup()
    end,
  },
}

