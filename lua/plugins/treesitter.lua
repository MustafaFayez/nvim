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
  },
  config = function()
    require('nvim-treesitter.parsers').get_parser_configs().asm = {
      install_info = {
        url = 'https://github.com/rush-rs/tree-sitter-asm.git',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'ptx',
    }
  end,
}


