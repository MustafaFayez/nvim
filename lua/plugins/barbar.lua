return  {
    'romgrk/barbar.nvim',
    dependencies = 'nvim-web-devicons',
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
