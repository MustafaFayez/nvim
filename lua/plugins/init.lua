return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'} 
  },
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    dependencies = {'nvim-lua/plenary.nvim', lazy = true},  
    lazy = true, 
    event = "VeryLazy",
    keys = {
      { '<leader>pf', "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
    }
  },
  'nvim-treesitter/playground',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
  'tpope/vim-fugitive', 
  {
    'numToStr/Comment.nvim',
    config = function()

      require('Comment').setup()
    end
  },
  {
    "ggandor/leap.nvim",
    keys = { "s", "S" },
    config = function()
      local leap = require "leap"
      leap.set_default_keymaps()
    end,
  },
  'RRethy/vim-illuminate',
  'rush-rs/tree-sitter-asm', 
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
      require'window-picker'.setup()
    end,
  },
  {
    "folke/todo-comments.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings

      -- refer to the configuration section below
    }
  },
  {
    "folke/trouble.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings

      -- refer to the configuration section below

    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    init = function()

      vim.o.timeout = true
      vim.o.timeoutlen = 300

    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()

      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
}
