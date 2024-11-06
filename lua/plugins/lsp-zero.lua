return {
  {
    'VonHeikemen/lsp-zero.nvim',
    -- branch = 'v3.x',
    lazy = true,
    config = function()

      -- This is where you modify the settings for lsp-zero
      -- Note: autocompletion settings will not take effect

      require('lsp-zero.settings').preset({})
    end
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      -- The arguments for .extend() have the same shape as `manage_nvim_cmp`: 
      -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

      require('lsp-zero.cmp').extend()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero.cmp').action() 

      cmp.setup({
        mapping = {
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "clang-format",
        "codelldb",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live

      local lsp = require('lsp-zero')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({buffer = bufnr})
        -- Check if the server supports signature help and set it accordingly
        if client.server_capabilities.signatureHelpProvider then
          require('lsp_signature').on_attach({
            bind = true,
            handler_opts = {border = "single"}
          }, bufnr)
        else
          client.server_capabilities.signatureHelpProvider = false
        end
      end)

      -- (Optional) Configure lua language server for neovim
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
      require('lspconfig').pyright.setup({
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        on_attach = lsp.on_attach,
        -- flags = lsp_flags,
        settings = {
          pyright = {
            disableOrganizeImports = true,
            disableDiagnostics = false,
          },
          python = {
            analysis = {
              -- typeCheckingMode = "off",
              -- diagnosticSeverityOverrides = "none"
              diagnosticSeverityOverrides = {
                reportUndefinedVariable = "none",
                analyzeUnannotatedFunctions = false,
                strictParameterNoneValue = false,
                enableTypeIgnoreComments = false,
                reportMissingModuleSource = "none",
                reportMissingImports = "none",
                reportUnusedExpression = "none",
                reportGeneralTypeIssues = "none"
              }
            },
          },
        }
      })
      -- require('lspconfig').pylint.setup({})
      require('lspconfig').bashls.setup({})
      require('lspconfig').clangd.setup({
        capabilities = {
          offsetEncoding = { "utf-16" },
        },
        on_attach = function (client, bufnr)
          client.server_capabilities.signatureHelpProvider = false
          lsp.on_attach(client, bufnr)
        end,
      })
      -- require'lspconfig'.ruff_lsp.setup{
      --   init_options = {
      --     settings = {
      --       -- Any extra CLI arguments for `ruff` go here.
      --       args = {},
          -- }
        -- }
      -- }
      -- require('lspconfig').pylsp.setup {
      --   filetypes = {'python'},
      --   settings = {
      --     configurationSources = {"flake8"},
      --     formatCommand = {"black"},
      --     pylsp = {
      --       plugins = {
      --         -- jedi_completion = {fuzzy = true},
      --         -- jedi_completion = {eager=true},
      --         jedi_completion = {
      --           include_params = true,
      --         },
      --         jedi_signature_help = {enabled = true},
      --         jedi = {
      --           extra_paths = {'~/projects/work_odoo/odoo14', '~/projects/work_odoo/odoo14'},
      --           -- environment = {"odoo"},
      --         },
      --         pyflakes={enabled=true},
      --         -- pylint = {args = {'--ignore=E501,E231', '-'}, enabled=true, debounce=200},
      --         pylsp_mypy={enabled=false},
      --         pycodestyle={
      --           enabled=true,
      --           ignore={'E501', 'E231', 'E226', 'W291', 'E302'},
      --           maxLineLength=120},
      --           yapf={enabled=true}
      --         }
      --       }
      --     }
      --   }
        lsp.setup()
      end

    }
  }
