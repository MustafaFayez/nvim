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
    'lewis6991/impatient.nvim',
}
