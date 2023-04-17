return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy  = true },
    config = function()
        require('lualine').setup {
            options = {
                -- icons_enabled = false,
                theme = 'horizon',
                -- component_separators = '|',
                -- section_separators = '',
            },
        }
    end

}

