return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy  = true },
    config = function()
        require('lualine').setup {
            options = {
                -- icons_enabled = false,
                theme = 'catppuccin',
                globalstatus = true,
                -- component_separators = '|',
                -- section_separators = '',
            },
        }
    end

}

