require("mustafaali")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({

    "git",
    "clone",

    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins')
-- Lua
vim.cmd[[colorscheme tokyonight-night]]
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg="#f4d7d7" })
vim.api.nvim_set_hl(0, 'LineNr', { fg="#f70084" })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg="#c6e2ff" })
