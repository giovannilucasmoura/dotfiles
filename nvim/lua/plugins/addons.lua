-- Small additions
return {
    {
        "ahmedkhalf/project.nvim",
        opts = {},
        event = "VeryLazy",
        config = function(_, opts)
            require("project_nvim").setup(opts)
            require("telescope").load_extension("projects")
        end,
        keys = {
            { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "benfowler/telescope-luasnip.nvim",
            config = function()
                require("telescope").load_extension("luasnip")
            end,
        },
    },
}
