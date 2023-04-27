return {
    'lervag/vimtex',
    config = function()
        vim.g.vimtex_quickfix_mode = 0
        vim.g.vimtex_view_method = 'zathura'

        -- Vimtex keybindings
        vim.api.nvim_set_keymap('n', '<leader>ll', ':VimtexCompile<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>lt', ':VimtexTocToggle<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>le', ':cnext<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>lE', ':cprevious<CR>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', '<leader>lq', ':VimtexQuickfixOpen<CR>', {noremap = true, silent = true})

        -- LaTeX section navigation mappings
        vim.api.nvim_buf_set_keymap(0, 'n', '[[', '/\\(\\\\section\\|\\\\subsection\\|\\\\subsubsection\\|\\\\paragraph\\|\\\\subparagraph\\)\\><CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', ']]', '/\\(\\\\section\\|\\\\subsection\\|\\\\subsubsection\\|\\\\paragraph\\|\\\\subparagraph\\)\\><CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '][', '/\\(\\\\section\\|\\\\subsection\\|\\\\subsubsection\\|\\\\paragraph\\|\\\\subparagraph\\)\\><CR>:normal! N<CR>', {noremap = true, silent = true})
        vim.api.nvim_buf_set_keymap(0, 'n', '[]', '/\\(\\\\section\\|\\\\subsection\\|\\\\subsubsection\\|\\\\paragraph\\|\\\\subparagraph\\)\\><CR>:normal! N<CR>:normal! N<CR>', {noremap = true, silent = true})
    end,
    ft = {'tex'}
}

