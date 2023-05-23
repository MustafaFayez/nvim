return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>e", ":Neotree toggle<CR>", desc = "Toggle tree" },
    }
}
