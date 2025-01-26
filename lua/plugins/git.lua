return {
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set("n", "<leader>gr", ":Gitsigns toggle_current_line_blame<CR>", {})
        end
    },
    {
        "tpope/vim-fugitive",

    }
}
