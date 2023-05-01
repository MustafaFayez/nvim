return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
<<<<<<< HEAD
        dependencies = {'nvim-lua/plenary.nvim'} 
    },
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
=======
        dependencies = {'nvim-lua/plenary.nvim', lazy = true},  
        lazy = true, 
        event = "VeryLazy",
        keys = {
            { '<leader>pf', "<CMD>Telescope find_files<CR>", mode = { "n", "v" } },
        }
>>>>>>> 05fea46 (made it faster using more lazy loading. added noice plugin as well)
    },
    {'folke/tokyonight.nvim'},
    -- {
    --     'rose-pine/neovim',
    --     name = 'rose-pine',
    --     config = function()
    --         require("rose-pine").setup()
    --         vim.cmd('colorscheme rose-pine')
    --     end
    -- },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive', 
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-web-devicons",
        },
        keys = {
            { "<leader>e", ":NvimTreeToggle<CR>", desc = "Toggle tree" },
        },
        config = function()
            require("nvim-tree").setup({})
        end

    },
    {
        'numToStr/Comment.nvim',
        config = function()

            require('Comment').setup()
        end
    },
    'ThePrimeagen/vim-be-good', 
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        'glacambre/firenvim',

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        cond = not not vim.g.started_by_firenvim,
        build = function()
            require("lazy").load({ plugins = "firenvim", wait = true })
            vim.fn["firenvim#install"](0)
        end
    },
    'lewis6991/impatient.nvim',
}
