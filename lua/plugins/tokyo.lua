return {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            transparent = true,
        })
    end,
    priority = 1000,
    opts = {},
}
