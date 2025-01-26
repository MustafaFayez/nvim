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
            sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 1,
                        {
                            function() return require('dap').status() end,
                            cond = function() return require('dap').session() ~= nil end,
                        },
                    },
                },
            },
        }
    end

}

