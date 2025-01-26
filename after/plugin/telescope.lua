local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
-- In your init.lua or a lua config file
vim.keymap.set('n', '<leader>pw', function()
  require('telescope.builtin').grep_string()
end, { desc = "Grep for word under cursor" })

