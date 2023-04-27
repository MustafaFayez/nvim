return {
    'dense-analysis/ale',
    config = function()
        -- Configure ALE for syntax checking and linting
        vim.g.ale_linters = {
            tex = {'chktex', 'lacheck'}
        }
        vim.g.ale_fixers = {
            tex = {'latexindent'}
        }
        vim.g.ale_fix_on_save = 1
    end
}

