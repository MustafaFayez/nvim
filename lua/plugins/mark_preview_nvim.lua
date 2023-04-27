return {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    config = function()
        -- Configure markdown-preview.nvim
        vim.g.mkdp_path_to_chrome = "google-chrome"
    end
}

