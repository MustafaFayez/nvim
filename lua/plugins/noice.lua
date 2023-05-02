return {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    keys = false,
    config = function()
        require("noice").setup({
            -- add any options here
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                },
            },
            notify = {
                level = 2, 
            }
        })
        require("notify").setup({
            background_colour = "#000000", -- replace with your preferred color
            log_level = 2,
            
        })
    end,
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    }
}
