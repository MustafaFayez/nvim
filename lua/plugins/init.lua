return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'} 
    },
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
        dependencies = {'nvim-lua/plenary.nvim', lazy = true},  
        lazy = true, 
        event = "VeryLazy",
        keys = {
            { '<leader>pf', "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
        }
    },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive', 
        {
        'numToStr/Comment.nvim',
        config = function()

            require('Comment').setup()
        end
    },
    {
        "ggandor/leap.nvim",
        keys = { "s", "S" },
        config = function()
            local leap = require "leap"
            leap.set_default_keymaps()
        end,
    },
    'RRethy/vim-illuminate'
}
