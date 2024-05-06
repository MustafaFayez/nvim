return {
  'akinsho/bufferline.nvim',
  branch = main,
  config = function()
    local bufferline1 = require('bufferline')
    bufferline1.setup {
      options = {
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        mode = "buffers",                               -- set to "tabs" to only show tabpages instead
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
        show_close_icon = false,
        offsets = {
          filetype = "neo-tree",
          text = "Tree",
        },
      },
    }
  end
}
