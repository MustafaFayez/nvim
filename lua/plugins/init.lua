return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        dependencies = {'nvim-lua/plenary.nvim'} 
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require("rose-pine").setup()
            vim.cmd('colorscheme rose-pine')
        end
    },
    {
        'nvim-treesitter/nvim-treesitter', 
        build = ':TSUpdate',
    },
    'nvim-treesitter/playground',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive', 
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},         -- Required
            {'hrsh7th/cmp-nvim-lsp'},     -- Required
            {'hrsh7th/cmp-buffer'},       -- Optional
            {'hrsh7th/cmp-path'},         -- Optional
            {'saadparwaiz1/cmp_luasnip'}, -- Optional
            {'hrsh7th/cmp-nvim-lua'},     -- Optional

            -- Snippets
            {'L3MON4D3/LuaSnip'},             -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
        }
    },
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
}
