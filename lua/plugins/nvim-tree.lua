return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-web-devicons",
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle()<CR>", desc = "Toggle tree" },
    },
    config = function()
        require("nvim-tree").setup {}
    end,
}

