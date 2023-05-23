return  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-web-devicons',
    event = 'BufAdd',
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
        require'barbar'.setup {
            sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = nil}
            NvimTree = true,

            -- Or, specify the text used for the offset:
            undotree = {text = 'undotree'},
            -- Or, specify the event which the sidebar executes when leaving:
            ['neo-tree'] = {event = 'BufWipeout'},

            -- Or, specify both
            Outline = {event = 'BufWinLeave', text = 'symbols-outline'},
            },
        }
    end,
}
