return {
  -- 'folke/tokyonight.nvim',
  -- lazy = false,
  -- config = function()
  --   require("tokyonight").setup({
  --     style = "night",
  --     transparent = true,
  --     on_highlights = function(highlights, colors)
  --       highlights.Visual = { bg = "#6066ff" }
  --       -- highlights.CursorLineNr = { fg = "#D60073", bold = true }
  --       -- highlights.LineNr = { fg = colors.grey, bg = "#D60073", bold = false }
  --     end
  --   })
  -- vim.cmd[[colorscheme tokyonight-night]]
  -- end,
  -- priority = 1000,
  -- opts = {},


  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function ()
    require("catppuccin").setup({
      flavour = "mocha",
      integrations = {
        neotree = true,
        notify = true,
        noice = true,
        treesitter = true,
        cmp = true,
        harpoon = true,
        mason = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.5, -- percentage of the shade to apply to the inactive window
    },
    vim.cmd.colorscheme "catppuccin-mocha",
  })
  end,

}
