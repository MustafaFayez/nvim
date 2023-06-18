return {
  'folke/tokyonight.nvim',
  lazy = false,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      on_highlights = function(highlights, colors)
        highlights.Visual = { bg = "#6066ff" }
        -- highlights.CursorLineNr = { fg = "#D60073", bold = true }
        -- highlights.LineNr = { fg = colors.grey, bg = "#D60073", bold = false }
      end
    })
  end,
  priority = 1000,
  opts = {},
}
