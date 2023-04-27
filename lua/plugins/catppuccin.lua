return {
    'catppuccin/nvim',
    name = 'catppuccin',
    event = 'VimEnter',
    config = function()
        require('catppuccin').setup()
        vim.cmd.colorscheme "catppuccin"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
}

