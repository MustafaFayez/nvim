return {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    lazy = true ,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        highlight = { 
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        ensure_installed = {"verilog", "cpp", "cuda", "yaml", "c", "lua", "python"},
        auto_install = true,
    }
}


