return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = { 'nvim-lua/plenary.nvim', lazy = true },
    lazy = true,
    event = "VeryLazy",
    keys = {
      { '<leader>pf', "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
    }
  },
  -- 'nvim-treesitter/playground',
  'ThePrimeagen/harpoon',
  'mbbill/undotree',
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
      require 'window-picker'.setup()
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
    'nvimtools/none-ls.nvim',
    event = "VeryLazy",
    config = function()
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.clang_format,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then

            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end
      })
    end
  },
  {
    "wookayin/semshi",
    build = ":UpdateRemotePlugins",
    version = "*", -- Recommended to use the latest release
    -- init = function()  -- example, skip if you're OK with the default config
    --   vim.g['semshi#error_sign'] = false
    -- end,
    -- config = function()
    --   -- any config or setup that would need to be done after plugin loading
    -- end,
  },
  {
    'RaafatTurki/corn.nvim',
    config = function()
      require 'corn'.setup {
        on_toggle = function(is_hidden)
          vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
        end,
        item_preprocess_func = function(item)
          return item
        end,
      }
    end
  },
  -- {
  --   "benlubas/molten-nvim",
  --   -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   build = ":UpdateRemotePlugins",
  --
  --   init = function()
  --       -- this is an example, not a default. Please see the readme for more configuration options
  --
  --       vim.g.molten_output_win_max_height = 12
  --   end,
  -- },
  'ray-x/lsp_signature.nvim',
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    opts = {
      handlers = { },
      ensure_installed = {
        "codelldb",
      }
    }
  },
  'nvim-neotest/nvim-nio',
  'sakhnik/nvim-gdb',
  -- 'github/copilot.vim'
}
