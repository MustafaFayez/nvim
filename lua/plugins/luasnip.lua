return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        {
            'rafamadriz/friendly-snippets',
            event = 'InsertEnter',
            config = function()
                -- Load LuaSnip snippets from friendly-snippets
                local ls = require("luasnip.loaders.from_vscode")
            end
        },
    },
    event = 'InsertEnter',
    config = function()
        local luasnip = require('luasnip')

        -- Load all available LuaSnip snippets
        luasnip.config.set_config({history = true})

        -- Keybindings for expanding and navigating snippets
        vim.api.nvim_set_keymap("i", "<Tab>", "<Plug>luasnip-expand-or-jump", {})
        vim.api.nvim_set_keymap("s", "<Tab>", "<Plug>luasnip-expand-or-jump", {})
        vim.api.nvim_set_keymap("i", "<S-Tab>", "<Plug>luasnip-jump-prev", {})
        vim.api.nvim_set_keymap("s", "<S-Tab>", "<Plug>luasnip-jump-prev", {})
    end
}

